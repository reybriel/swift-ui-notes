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
            List(NoteViewModel.all) {
                self.declareNavigationToEditNote(for: NoteListRow(note: $0))
            }
            .navigationBarTitle(Constants.title)
        }
    }
    
    // MARK: Actions
    
    private func declareNavigationToEditNote<RowView: View>(for view: RowView) -> some View {
        NavigationLink(destination: NoteEditView()) { view }
    }
}
