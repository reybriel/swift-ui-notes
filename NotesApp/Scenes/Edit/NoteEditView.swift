import SwiftUI

struct NoteEditView: View {
    let note: NoteViewModel
    
    var body: some View {
        Text("Hello note edit!")
            .navigationBarTitle(title, displayMode: .inline)
    }

    private var title: Text {
        Text(note.title)
    }
}
