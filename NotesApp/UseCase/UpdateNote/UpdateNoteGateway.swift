import Combine

protocol UpdateNoteGateway: AnyObject {
    func createUpdateSream(note: NoteViewModel) -> Future<NoteViewModel, Error>
}

extension NotesDAO: UpdateNoteGateway {
    func createUpdateSream(note: NoteViewModel) -> Future<NoteViewModel, Error> {
        Future { completion in
            self.update(note, completion: completion)
        }
    }
}
