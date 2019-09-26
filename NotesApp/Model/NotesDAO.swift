import Combine
import CoreData

extension Note {
    fileprivate func createManagedObject(at context: NSManagedObjectContext)  {
        let managedObject: CDNote = .init(context: context)
        managedObject.title = title
        managedObject.content = content
        managedObject.creationDate = creationDate
        managedObject.lastEditDate = lastEditDate
    }

    fileprivate static func from(cdNote: CDNote) -> Note {
        Note(id: cdNote.objectID.description,
             title: cdNote.title ?? "",
             content: cdNote.content,
             creationDate: cdNote.creationDate ?? Date(),
             lastEditDate: cdNote.lastEditDate ?? Date())
    }
}

final class NotesDAO {
    static let shared: NotesDAO = .init()

    let didChange: PassthroughSubject<Void, Never> = .init()

    private let persistentContainer: NSPersistentContainer = {
        let container: NSPersistentContainer = .init(name: "NotesModel")
        container.loadPersistentStores { _, _ in }
        return container
    }()

    private var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

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

    func getAllNotes(completion: @escaping VoidReturnOneArgClosure<Result<[Note], Error>>) {
        context.perform {
            let request: NSFetchRequest<CDNote> = CDNote.fetchRequest()
            request.fetchBatchSize = 50
            request.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
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
}
