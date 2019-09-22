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
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(NoteViewModel.all) { note in
                        NavigationLink(destination: NoteEditView(note: note)) {
                            NoteListRow(note: note)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .navigationBarTitle(Constants.title)
            .navigationBarItems(
                trailing: Button(
                    action: toggleShowingTitleView,
                    label: { Text(Constants.newNoteItemTitle) }
                )
            ).sheet(isPresented: $isShowingNoteTitleView) {
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
