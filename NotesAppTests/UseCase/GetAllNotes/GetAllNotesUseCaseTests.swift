@testable
import NotesApp

final class GetAllNotesUseCaseTests: NotesTestCase {
    private var sut: GetAllNotesUseCase!
    private var gateway: GetAllNotesGatewayStub!
    private var presenter: GetAllNotesUseCasePresenterSpy!

    override func setUp() {
        gateway = GetAllNotesGatewayStub()
        presenter = GetAllNotesUseCasePresenterSpy()
        sut = GetAllNotesUseCase(presenter: presenter, gateway: gateway)
    }

    func testHasToShowFeedbackOnGetFailure() {
        gateway.returnError()
        sut.run()
        expect(presenter.invokedShowFeedback)
    }

    func testHasToShowNotesListOnGetSuccess() {
        gateway.returnMock()
        sut.run()
        expect(presenter.invokedListNotes)
    }

    func testHasToShowEmptyStateOnGetEmptyList() {
        gateway.returnEmpty()
        sut.run()
        expect(presenter.invokedShowEmptyState)
    }
}
