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
}

final class NotesDAO {
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
}
