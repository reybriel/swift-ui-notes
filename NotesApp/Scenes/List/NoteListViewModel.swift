import Combine

final class NoteListViewModel: ObservableObject {
    @Published var isShowingNoteCreationView: Bool = false
    @Published var notes: [NoteViewModel] = []

    func onAppear() {
        GetAllNotesUseCaseFactory.make(presenter: self).run()
        SubscribeToNoteChangesUseCaseFactory.make(presenter: self).run()
    }
}

extension NoteListViewModel: GetAllNotesUseCasePresenter {

    func list(notes: [Note]) {
        self.notes = notes.map({ note -> NoteViewModel in
            note.viewModel
        })
    }

    func show(feedback: AlertFeedback) {

    }
}

extension NoteListViewModel: SubscribeToNoteChangesUseCasePresenter {

    func showSuccess() {
        GetAllNotesUseCaseFactory.make(presenter: self).run()
    }
}
