import SwiftUI

enum NoteListRowFactory {
    static func make(note: NoteViewModel) -> some View {
        NoteListRow(viewModel: NoteListRowModel(note: note))
    }
}
