import Combine
import CoreData

// MARK: - Note extension

extension Note {
    fileprivate func createManagedObject(at context: NSManagedObjectContext)  {
        let managedObject: CDNote = .init(context: context)
        managedObject.title = title
        managedObject.content = content
        managedObject.creationDate = creationDate
        managedObject.lastEditDate = lastEditDate
    }

    fileprivate static func from(cdNote: CDNote) -> Note {
        // TODO: Verify what comes out of objectID.description
        Note(id: cdNote.objectID.description,
             title: cdNote.title ?? "",
             content: cdNote.content,
             creationDate: cdNote.creationDate ?? Date(),
             lastEditDate: cdNote.lastEditDate ?? Date())
    }
}

// MARK: - DAO

final class NotesDAO {

    // MARK: Properties
    typealias SortingKey = NoteSortingKey

    static let shared: NotesDAO = .init(persistentContainerName: "NotesModel")
    let didChange: PassthroughSubject<Void, Never> = .init()
    private let persistentContainer: NSPersistentContainer

    private var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    init(persistentContainerName: String) {
        persistentContainer = NSPersistentContainer(name: persistentContainerName)
        persistentContainer.loadPersistentStores { _, _ in }
    }

    // MARK: - Functions

    func saveNote(_ note: Note, completion: @escaping VoidReturnOneArgClosure<Result<Void, Error>>) {
        context.perform {
            do {
                note.createManagedObject(at: self.context)
                try self.context.save()
                completion(.success(()))
                self.didChange.send(())
            } catch {
                completion(.failure(error))
            }
        }
    }

    func saveNote(with title: String, completion: @escaping VoidReturnOneArgClosure<Result<Void, Error>>) {
        let now = Date()
        let note = Note(id: "",
                        title: title,
                        content: nil,
                        creationDate: now,
                        lastEditDate: now)
        saveNote(note, completion: completion)
    }

    func getAllNotes(sortingKey: SortingKey, completion: @escaping VoidReturnOneArgClosure<Result<[Note], Error>>) {
        context.perform {
            let request: NSFetchRequest<CDNote> = self.createFetchRequest(sortingKey: sortingKey)
            do {
                let notes = try request.execute().map({ cdNote -> Note in
                    Note.from(cdNote: cdNote)
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
