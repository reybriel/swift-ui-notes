@testable
import NotesApp

import class XCTest.XCTestCase

final class UpdateNoteUseCaseTests: XCTestCase {
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
        wait(for: [presenter.invokedShowFeedback], timeout: 0.1)
    }

    func testHasToShowNoteOnUpdateSuccess() {
        gateway.returnMock()
        sut.run()
        wait(for: [presenter.invokedShowNote], timeout: 0.1)
    }
}
