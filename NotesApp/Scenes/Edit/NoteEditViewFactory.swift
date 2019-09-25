import SwiftUI

enum NoteEditViewFactory {
    static func make(note: NoteViewModel) -> some View {
        NoteEditView(note: note)
    }
}
