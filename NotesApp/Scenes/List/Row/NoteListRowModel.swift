final class NoteListRowModel {
    private let note: NoteViewModel

    var noteTitle: String {
        note.title
    }

    var noteContent: String {
        note.content
    }

    var isShowingContent: Bool {
        !note.content.isEmpty
    }

    init(note: NoteViewModel) {
        self.note = note
    }
}
