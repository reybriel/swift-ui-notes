@testable
import NotesApp

import class XCTest.XCTestCase

final class SubscribeToNoteChangesUseCaseTests: XCTestCase {
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
        wait(for: [presenter.invokedShowSuccess], timeout: 0.1)
    }
}
