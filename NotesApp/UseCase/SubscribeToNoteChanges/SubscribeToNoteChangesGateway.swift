import Combine

protocol SubscribeToNoteChangesGateway: AnyObject {
    func createNoteChangesUpstream() -> AnyPublisher<Void, Never>
}

extension NotesDAO: SubscribeToNoteChangesGateway {
    func createNoteChangesUpstream() -> AnyPublisher<Void, Never> {
        NotesDAO.shared.didChange.eraseToAnyPublisher()
    }
}
