import Combine

final class NoteEditViewModel: ObservableObject {
    @Published var text: String
    private var note: NoteViewModel

    var isSaveButtonDisabled: Bool {
        note.content == text
    }

    var title: String {
        note.title
    }

    init(note: NoteViewModel) {
        self.note = note
        self.text = note.content
    }

    func onSaveButtonTap() {
        let updatedNote = NoteViewModel(id: note.id,
                                        title: note.title,
                                        content: text)
        UpdateNoteUseCaseFactory.make(note: updatedNote, presenter: self).run()
    }
}

extension NoteEditViewModel: UpdateNoteUseCasePresenter {

    func show(note: NoteViewModel) {
        self.note.content = note.content
    }

    func show(feedback: AlertFeedback) {
    }
}
