import SwiftUI

enum NoteCreateViewFactory {
    static func make() -> some View {
        NoteCreateView(viewModel: NoteCreateViewModel(), createNoteWithTitleGateway: NotesDAO())
    }
}
