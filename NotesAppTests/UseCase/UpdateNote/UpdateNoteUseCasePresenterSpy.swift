@testable
import NotesApp

import class XCTest.XCTestExpectation

final class UpdateNotesUseCasePresenterSpy: UpdateNoteUseCasePresenter {
    let invokedShowFeedback = XCTestExpectation(description: "Invoke show(fedback:)")
    let invokedShowNote = XCTestExpectation(description: "Invoke show(note:)")

    func show(feedback: AlertFeedback) {
        invokedShowFeedback.fulfill()
    }

    func show(note: NoteViewModel) {
        invokedShowNote.fulfill()
    }
}
