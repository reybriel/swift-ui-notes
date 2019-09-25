import SwiftUI

// MARK: - Constants

private enum Constants {
    static let title: String = "Notes"
    static let newNoteItemTitle: String = "Add"
}

// MARK: - List View

struct NoteListView: View {
    
    // MARK: Properties
    
    @State
    private var isShowingNoteTitleView: Bool = false

    // MARK: Body
    
    var body: some View {
        NavigationView {
            CleanList(items: NoteViewModel.all) { item in
                NavigationLink(destination: NoteEditViewFactory.make(note: item)) {
                    NoteListRow(note: item)
                }
            }
            .navigationBarTitle(Constants.title)
            .navigationBarItems(trailing: rightBarButton)
            .sheet(isPresented: $isShowingNoteTitleView) {
                NoteCreateViewFactory.make()
            }
        }
    }

    private var rightBarButton: Button<Text> {
        Button<Text>(Constants.newNoteItemTitle, action: toggleShowingTitleView)
    }
    
    private func toggleShowingTitleView() {
        isShowingNoteTitleView.toggle()
    }
}
