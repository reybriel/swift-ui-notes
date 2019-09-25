import Combine

protocol CreateNoteWithTitleGateway: AnyObject {
    func createSaveUpstream(noteTitle: String) -> Future<Void, Error>
}

extension NotesDAO: CreateNoteWithTitleGateway {
    func createSaveUpstream(noteTitle: String) -> Future<Void, Error> {
        Future { completion in
            self.saveNote(with: noteTitle, completion: completion)
        }
    }
}
