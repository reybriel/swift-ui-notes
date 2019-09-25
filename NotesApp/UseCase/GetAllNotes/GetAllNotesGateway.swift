import Combine

protocol GetAllNotesGateway: AnyObject {
    func createRequestUpstream() -> Future<[Note], Error>
}

extension NotesDAO: GetAllNotesGateway {
    func createRequestUpstream() -> Future<[Note], Error> {
        Future { completion in
            self.getAllNotes(completion: completion)
        }
    }
}
