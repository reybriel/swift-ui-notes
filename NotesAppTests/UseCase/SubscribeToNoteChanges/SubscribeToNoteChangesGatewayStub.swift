@testable
import NotesApp

import Combine

final class SubscribeToNoteChangesGatewayStub: SubscribeToNoteChangesGateway {
    func createNoteChangesUpstream() -> AnyPublisher<Void, Never> {
        Just<Int>(0).map({ (_) -> Void in }).eraseToAnyPublisher()
    }
}
