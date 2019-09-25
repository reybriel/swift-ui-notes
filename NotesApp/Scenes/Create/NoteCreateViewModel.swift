import Combine

final class NoteCreateViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var shouldShowAlert: Bool = false
    private var alertFeedback: AlertFeedback = .empty
    
    var alertTitle: String {
        alertFeedback.title
    }
    
    var alertMessage: String {
        alertFeedback.message
    }
}

extension NoteCreateViewModel: CreateNoteWithTitleUseCasePresenter {
    
    func showSuccess() {
        title = ""
    }
    
    func show(feedback: AlertFeedback) {
        alertFeedback = feedback
        shouldShowAlert = true
    }
}