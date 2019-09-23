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

    private var rightBarButton: BarButton<Text> {
        BarButton(action: toggleShowingTitleView, label: Text(Constants.newNoteItemTitle))
    }

    // MARK: Body
    
    var body: some View {
        NavigationView {
            CleanList(items: NoteViewModel.all) { note in
                NavigationLink(destination: NoteEditView(note: note)) {
                    NoteListRow(note: note)
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .navigationBarTitle(Constants.title)
            .navigationBarItems(trailing: rightBarButton)
            .sheet(isPresented: $isShowingNoteTitleView) {
                NoteTitleView { title in
                    self.toggleShowingTitleView()
                    print(title)
                }
            }
        }
    }
    
    private func toggleShowingTitleView() {
        isShowingNoteTitleView.toggle()
    }
}
