import Combine
import CoreData

// MARK: - Note extension

extension Note {
    fileprivate func createManagedObject(at context: NSManagedObjectContext)  {
        let managedObject: CDNote = .init(context: context)
        managedObject.id = id
        managedObject.title = title
        managedObject.content = content
        managedObject.creationDate = creationDate
        managedObject.lastEditDate = lastEditDate
    }
}

// MARK: - CDNote extension

extension CDNote {
    fileprivate var note: Note {
        Note(id: id ?? UUID().uuidString,
             title: title ?? "",
             content: content,
             creationDate: creationDate ?? Date(),
             lastEditDate: lastEditDate ?? Date())
    }
}

// MARK: - DAO

final class NotesDAO {

    // MARK: Properties
    typealias SortingKey = NoteSortingKey

    #if TEST
    static let shared: NotesDAO = .init(persistentContainerName: "ReleaseContainer")
    #else
    static let shared: NotesDAO = .init(persistentContainerName: "TestContainer")
    #endif

    let didChange: PassthroughSubject<Void, Never> = .init()
    private let persistentContainer: NSPersistentContainer

    private var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    // MARK: - Initializer

    init(persistentContainerName: String) {
        persistentContainer = NSPersistentContainer(name: persistentContainerName)
        persistentContainer.loadPersistentStores { _, _ in }
    }

    // MARK: Functions

    func saveNote(_ note: Note, completion: @escaping VoidReturnOneArgClosure<Result<Void, Error>>) {
        context.perform {
            do {
                note.createManagedObject(at: self.context)
                try self.context.save()
                self.didChange.send(())
                completion(.success(()))
            } catch {
                completion(.failure(error))
            }
        }
    }

    func saveNote(with title: String, completion: @escaping VoidReturnOneArgClosure<Result<Void, Error>>) {
        let now = Date()
        let note = Note(id: UUID().uuidString,
                        title: title,
                        content: nil,
                        creationDate: now,
                        lastEditDate: now)
        saveNote(note, completion: completion)
    }

    func update(_ note: NoteViewModel, completion: @escaping VoidReturnOneArgClosure<Result<NoteViewModel, Error>>) {
        context.perform {
            do {
                let byId: NSPredicate = .init(format: "id == %@", note.id)
                let request = self.createFetchRequest(predicate: byId, sortingKey: .default)
                if let cdNote = try request.execute().first {
                    try self.update(note: cdNote, with: note)
                    self.didChange.send(())
                    completion(.success(note))
                } else {
                    completion(.failure(NotesDAOError.noteNotFound))
                }
            } catch {
                completion(.failure(error))
            }
        }
    }

    private func createFetchRequest(predicate: NSPredicate, sortingKey: SortingKey) -> NSFetchRequest<CDNote> {
        let request: NSFetchRequest = CDNote.fetchRequest()
        request.predicate = predicate
        request.fetchBatchSize = 50
        request.sortDescriptors = [sortingKey.createSortDescriptor()]
        return request
    }

    private func update(note: CDNote, with viewModel: NoteViewModel) throws {
        note.title = viewModel.title
        note.content = viewModel.content
        note.lastEditDate = Date()
        try context.save()
    }

    func getAllNotes(sortingKey: SortingKey, completion: @escaping VoidReturnOneArgClosure<Result<[Note], Error>>) {
        context.perform {
            do {
                let request: NSFetchRequest<CDNote> = self.createFetchRequest(sortingKey: sortingKey)
                let notes = try request.execute().map({ cdNote -> Note in
                    cdNote.note
                })
                completion(.success(notes))
            } catch {
                completion(.failure(error))
            }
        }
    }

    private func createFetchRequest(sortingKey: SortingKey) -> NSFetchRequest<CDNote> {
        let request: NSFetchRequest = CDNote.fetchRequest()
        request.fetchBatchSize = 50
        request.sortDescriptors = [sortingKey.createSortDescriptor()]
        return request
    }
}

// MARK: - Related types

enum NotesDAOError: Error {
    case noteNotFound
}
