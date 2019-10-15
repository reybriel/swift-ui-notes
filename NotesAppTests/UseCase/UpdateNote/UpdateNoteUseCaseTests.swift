@testable
import NotesApp

final class UpdateNoteUseCaseTests: NotesTestCase {
    private var sut: UpdateNoteUseCase!
    private var gateway: UpdateNoteGatewayStub!
    private var presenter: UpdateNotesUseCasePresenterSpy!

    override func setUp() {
        super.setUp()
        gateway = UpdateNoteGatewayStub()
        presenter = UpdateNotesUseCasePresenterSpy()
        sut = UpdateNoteUseCase(noteViewModel: .mock, gateway: gateway, presenter: presenter)
    }

    func testHasToShowFeebackOnUpdateFailure() {
        gateway.returnError()
        sut.run()
        expect(presenter.invokedShowFeedback)
    }

    func testHasToShowNoteOnUpdateSuccess() {
        gateway.returnMock()
        sut.run()
        expect(presenter.invokedShowNote)
    }
}
