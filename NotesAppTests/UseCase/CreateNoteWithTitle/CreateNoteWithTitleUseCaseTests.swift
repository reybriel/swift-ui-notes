@testable
import NotesApp

final class CreateNoteWithTitleUseCaseTests: NotesTestCase {
    private var sut: CreateNoteWithTitleUseCase!
    private var gateway: CreateNoteWithTitleGatewayStub!
    private var presenter: CreateNoteWithTitleUseCasePresenterSpy!

    override func setUp() {
        gateway = CreateNoteWithTitleGatewayStub()
        presenter = CreateNoteWithTitleUseCasePresenterSpy()
        sut = CreateNoteWithTitleUseCase(title: "test-note", presenter: presenter, gateway: gateway)
    }

    func testHasToShowFeedbackOnCreateFailure() {
        gateway.returnError()
        sut.run()
        expect(presenter.invokedShowFeedback)
    }

    func testHasToShowFeedbackOnTryCreatingWithEmptyTitle() {
        sut = CreateNoteWithTitleUseCase(title: "", presenter: presenter, gateway: gateway)
        sut.run()
        expect(presenter.invokedShowFeedback, tolerance: 0.0)
        expect(presenter.lastGivenAlertFeedback == AlertFeedback.attemptToCreateNoteWithoutTitle)
    }

    func testHasToShowSuccessOnCreateSuccess() {
        gateway.returnSuccess()
        sut.run()
        expect(presenter.invokedShowSuccess)
    }
}
