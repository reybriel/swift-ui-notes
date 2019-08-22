import SwiftUI

// MARK: - Constants

private enum Constants {
    static let newNoteTitle: String = "New Note"
}

// MARK: - Edit View

struct NoteEditView: View {
    
    // MARK: Properties
    
    private var title: Text {
        Text(note?.title ?? Constants.newNoteTitle)
    }
    
    let note: NoteViewModel?
    
    // MARK:Body
    
    var body: some View {
        Text("Hello note edit!")
            .navigationBarTitle(title, displayMode: .inline)
    }
}
