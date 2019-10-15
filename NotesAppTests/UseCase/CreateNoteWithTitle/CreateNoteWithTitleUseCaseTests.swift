@testable
import NotesApp

import class XCTest.XCTestCase

final class CreateNoteWithTitleUseCaseTests: XCTestCase {
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
        wait(for: [presenter.invokedShowFeedback], timeout: 0.1)
    }

    func testHasToShowSuccessOnCreateSuccess() {
        gateway.returnSuccess()
        sut.run()
        wait(for: [presenter.invokedShowSuccess], timeout: 0.1)
    }
}
