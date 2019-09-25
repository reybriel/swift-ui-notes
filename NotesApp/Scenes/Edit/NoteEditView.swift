import SwiftUI

// MARK: - Edit View

struct NoteEditView: View {
    
    // MARK: Properties
    
    private var title: Text {
        Text(note.title)
    }
    
    let note: NoteViewModel
    
    // MARK:Body
    
    var body: some View {
        Text("Hello note edit!")
            .navigationBarTitle(title, displayMode: .inline)
    }
}
