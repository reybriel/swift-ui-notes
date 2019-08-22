import SwiftUI

// MARK: - Constants

private enum Constants {
    static let title: String = "Notes"
}

// MARK: - List View

struct NoteListView: View {
    
    // MARK: Body
    
    var body: some View {
        NavigationView {
            List(NoteViewModel.all) { note in
                NavigationLink(destination: NoteEditView(note: note)) {
                    NoteListRow(note: note)
                }
            }
            .navigationBarTitle(Constants.title)
        }
    }
}
