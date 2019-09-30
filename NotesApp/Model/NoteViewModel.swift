struct NoteViewModel: Identifiable {
    var id: String
    var title: String
    var content: String

    static func from(note: Note) -> NoteViewModel {
        NoteViewModel(id: note.id,
                      title: note.title,
                      content: note.content ?? ""
        )
    }
}
