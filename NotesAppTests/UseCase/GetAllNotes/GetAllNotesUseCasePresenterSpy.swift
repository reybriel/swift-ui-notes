@testable
import NotesApp

import class XCTest.XCTestExpectation

final class GetAllNotesUseCasePresenterSpy: GetAllNotesUseCasePresenter {
    let invokedListNotes = XCTestExpectation(description: "Invoke list(notes:)")
    let invokedShowFeedback = XCTestExpectation(description: "Invoke show(feedback:)")
    let invokedShowEmptyState = XCTestExpectation(description: "Invoke showEmptyState")

    func list(notes: [Note]) {
        invokedListNotes.fulfill()
    }

    func show(feedback: AlertFeedback) {
        invokedShowFeedback.fulfill()
    }

    func showEmptyState() {
        invokedShowEmptyState.fulfill()
    }
}
