@testable
import NotesApp

import class XCTest.XCTestExpectation

final class CreateNoteWithTitleUseCasePresenterSpy: CreateNoteWithTitleUseCasePresenter {
    let invokedShowSuccess = XCTestExpectation(description: "Invoke showSuccess")
    let invokedShowFeedback = XCTestExpectation(description: "Invoke show(feedback:)")
    private(set) var lastGivenAlertFeedback: AlertFeedback?

    func showSuccess() {
        invokedShowSuccess.fulfill()
    }

    func show(feedback: AlertFeedback) {
        lastGivenAlertFeedback = feedback
        invokedShowFeedback.fulfill()
    }
}
