import SwiftUI

struct NoteListView: View {
    @ObservedObject var viewModel: NoteListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.notes) { item in
                NavigationLink(destination: NoteEditViewFactory.make(note: item)) {
                    NoteListRowFactory.make(note: item)
                }
            }
            .navigationBarTitle(Strings.NoteList.pageTitle)
            .navigationBarItems(trailing: rightBarButton)
            .createNote($viewModel.isShowingNoteCreationView)
        }
        .onAppear(perform: viewModel.onAppear)
    }

    private var rightBarButton: Button<Text> {
        Button<Text>(Strings.NoteList.rightBarButton, action: viewModel.toggleShowingCreationView)
    }
}
