import Combine

final class NoteListViewModel: ObservableObject {
    @Published var isShowingNoteCreationView: Bool = false
    @Published var isShowingEmptyState: Bool = false
    @Published var isShowingAlert: Bool = false
    @Published var notes: [NoteViewModel] = []

    private var alertFeedback: AlertFeedback = .init(title: "", message: "")

    var alertTitle: String {
        alertFeedback.title
    }

    var alertMessage: String {
        alertFeedback.message
    }

    func onAppear() {
        GetAllNotesUseCaseFactory.make(presenter: self).run()
        SubscribeToNoteChangesUseCaseFactory.make(presenter: self).run()
    }

    func toggleShowingCreationView() {
        isShowingNoteCreationView.toggle()
    }
}

extension NoteListViewModel: GetAllNotesUseCasePresenter {

    func list(notes: [Note]) {
        isShowingEmptyState = false
        self.notes = notes.map({ note -> NoteViewModel in
            NoteViewModel.from(note: note)
        })
    }

    func showEmptyState() {
        isShowingEmptyState = true
    }

    func show(feedback: AlertFeedback) {
        alertFeedback = feedback
        isShowingAlert = true
    }
}

extension NoteListViewModel: SubscribeToNoteChangesUseCasePresenter {

    func showSuccess() {
        GetAllNotesUseCaseFactory.make(presenter: self).run()
    }
}
