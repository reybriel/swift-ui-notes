@testable
import NotesApp

import struct Combine.Just
import struct Combine.AnyPublisher

final class SubscribeToNoteChangesGatewayStub: SubscribeToNoteChangesGateway {
    func createNoteChangesUpstream() -> AnyPublisher<Void, Never> {
        Just<Int>(0).map({ (_) -> Void in }).eraseToAnyPublisher()
    }
}
