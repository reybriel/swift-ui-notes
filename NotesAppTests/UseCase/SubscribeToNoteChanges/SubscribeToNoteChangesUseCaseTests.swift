@testable
import NotesApp

final class SubscribeToNoteChangesUseCaseTests: NotesTestCase {
    private var sut: SubscribeToNoteChangesUseCase!
    private var gateway: SubscribeToNoteChangesGatewayStub!
    private var presenter: SubscribeToNoteChangesUseCasePresenterSpy!

    override func setUp() {
        gateway = SubscribeToNoteChangesGatewayStub()
        presenter = SubscribeToNoteChangesUseCasePresenterSpy()
        sut = SubscribeToNoteChangesUseCase(presenter: presenter, gateway: gateway)
    }

    func testHasToShowSuccessWhenChange() {
        sut.run()
        expect(presenter.invokedShowSuccess)
    }
}
