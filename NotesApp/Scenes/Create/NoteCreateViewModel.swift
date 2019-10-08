import SwiftUI
import Combine

final class NoteCreateViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var isShowingAlert: Bool = false
    private var alertFeedback: AlertFeedback = .empty
    private var isPresented: Binding<Bool>

    init(isPresented: Binding<Bool>) {
        self.isPresented = isPresented
    }

    var alertTitle: String {
        alertFeedback.title
    }
    
    var alertMessage: String {
        alertFeedback.message
    }

    func onTextFieldCommit() {
        CreateNoteWithTitleUseCaseFactory.make(title: title, presenter: self,
                                               gateway: NotesDAO.shared).run()
    }

    func onCloseButtonTap() {
        isPresented.wrappedValue = false
    }
}

extension NoteCreateViewModel: CreateNoteWithTitleUseCasePresenter {
    
    func showSuccess() {
        isPresented.wrappedValue = false
        title = ""
    }
    
    func show(feedback: AlertFeedback) {
        alertFeedback = feedback
        isShowingAlert = true
    }
}
