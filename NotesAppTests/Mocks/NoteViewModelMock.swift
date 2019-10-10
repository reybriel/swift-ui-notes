@testable
import NotesApp

extension NoteViewModel {

    static var mock: NoteViewModel {
        NoteViewModel(id: "4", title: "Single", content: "So alone!")
    }

    static var mocks: [NoteViewModel] {
        [
            NoteViewModel(id: "1", title: "First note", content: "First note content"),
            NoteViewModel(id: "2", title: "Second note", content: "Second note content"),
            NoteViewModel(id: "3", title: "Third note", content: "Unpredictable content")
        ]
    }
}
