@testable
import NotesApp

import class XCTest.XCTestCase

final class GetAllNotesUseCaseTests: XCTestCase {
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
        wait(for: [presenter.invokedShowFeedback], timeout: 0.1)
    }

    func testHasToShowNotesListOnGetSuccess() {
        gateway.returnMock()
        sut.run()
        wait(for: [presenter.invokedListNotes], timeout: 0.1)
    }

    func testHasToShowEmptyStateOnGetEmptyList() {
        gateway.returnEmpty()
        sut.run()
        wait(for: [presenter.invokedShowEmptyState], timeout: 0.1)
    }
}
