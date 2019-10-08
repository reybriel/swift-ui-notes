@testable
import NotesApp

extension NoteViewModel {

    static var mock: NoteViewModel {
        NoteViewModel(id: "", title: "Single", content: "So alone!")
    }

    static var mocks: [NoteViewModel] {
        [
            NoteViewModel(id: "", title: "First note", content: "First note content"),
            NoteViewModel(id: "", title: "Second note", content: "Second note content"),
            NoteViewModel(id: "", title: "Third note", content: "Unpredictable content")
        ]
    }
}
