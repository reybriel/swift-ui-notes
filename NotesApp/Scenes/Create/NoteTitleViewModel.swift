import Combine

final class NoteTitleViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var shouldShowAlert: Bool = false
    private(set) var alertFeedback: AlertFeedback = .empty
}

extension NoteTitleViewModel: CreateNoteWithTitleUseCasePresenter {
    
    func showSuccess() {
        title = ""
    }
    
    func show(feedback: AlertFeedback) {
        alertFeedback = feedback
        shouldShowAlert = true
    }
}
