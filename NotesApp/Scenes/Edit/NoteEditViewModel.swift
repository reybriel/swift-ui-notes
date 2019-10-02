import Combine

final class NoteEditViewModel: ObservableObject {
    @Published var text: String = ""
    private var note: NoteViewModel

    var isSaveButtonDisabled: Bool {
        note.content == text
    }

    var title: String {
        note.title
    }

    init(note: NoteViewModel) {
        self.note = note
    }

    func onSaveButtonTap() {
        note.content = text
    }
}
