@testable
import NotesApp

extension AlertFeedback: Equatable {
    public static func == (lhs: AlertFeedback, rhs: AlertFeedback) -> Bool {
        lhs.title == rhs.title
    }
}
