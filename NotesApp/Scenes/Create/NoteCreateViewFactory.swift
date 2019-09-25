import SwiftUI

enum NoteCreateViewFactory {
    static func make(isPresented: Binding<Bool>) -> some View {
        NoteCreateView(viewModel: NoteCreateViewModel(isPresented: isPresented),
                       createNoteWithTitleGateway: NotesDAO())
    }
}
