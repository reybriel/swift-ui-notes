import Combine

final class NoteListViewModel: ObservableObject {
    @Published var isShowingNoteCreationView: Bool = false
    @Published var notes: [NoteViewModel] = []
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
