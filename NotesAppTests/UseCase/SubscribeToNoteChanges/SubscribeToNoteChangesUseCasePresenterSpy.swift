@testable
import NotesApp

import class XCTest.XCTestExpectation

final class SubscribeToNoteChangesUseCasePresenterSpy: SubscribeToNoteChangesUseCasePresenter {
    let invokedShowSuccess = XCTestExpectation(description: "Invoke showSuccess")

    func showSuccess() {
        invokedShowSuccess.fulfill()
    }
}
