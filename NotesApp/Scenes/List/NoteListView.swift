import SwiftUI

// MARK: - Constants

private enum Constants {
    static let title: String = "Notes"
    static let newNoteItemTitle: String = "Add"
}

// MARK: - List View

struct NoteListView: View {
    
    // MARK: Properties

    @ObservedObject
    var viewModel: NoteListViewModel

    // MARK: Body
    
    var body: some View {
        NavigationView {
            CleanList(items: viewModel.notes) { item in
                NavigationLink(destination: NoteEditViewFactory.make(note: item)) {
                    NoteListRow(note: item)
                }
            }
            .navigationBarTitle(Constants.title)
            .navigationBarItems(trailing: rightBarButton)
            .createNote($viewModel.isShowingNoteCreationView)
        }
        .onAppear {
            GetAllNotesUseCaseFactory.make(presenter: self.viewModel).run()
        }
    }

    private var rightBarButton: Button<Text> {
        Button<Text>(Constants.newNoteItemTitle, action: toggleShowingTitleView)
    }
    
    private func toggleShowingTitleView() {
        viewModel.isShowingNoteCreationView.toggle()
    }
}
