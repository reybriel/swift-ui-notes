import SwiftUI

enum NoteEditViewFactory {
    static func make(note: NoteViewModel) -> some View {
        NoteEditView(viewModel: NoteEditViewModel(note: note))
    }
}
