struct AlertFeedback {
    let title: String
    let message: String
}

extension AlertFeedback {
    static let empty: AlertFeedback = .init(title: "", message: "")
    static let attemptToCreateNoteWithoutTitle: AlertFeedback = .init(title: "Unable to create Note",
                                                                      message: "No title was provided")
}
