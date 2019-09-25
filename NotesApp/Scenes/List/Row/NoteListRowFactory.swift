import SwiftUI

enum NoteListRowFactory {
    static func make(note: NoteViewModel) -> some View {
        NoteListRow(note: note)
    }
}
