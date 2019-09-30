import SwiftUI

struct NoteListView: View {
    @ObservedObject var viewModel: NoteListViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isShowingEmptyState {
                    Text(Strings.NoteList.emptyStateMessage)
                        .font(.headline)
                } else {
                    List(viewModel.notes) { item in
                        NavigationLink(destination: NoteEditViewFactory.make(note: item)) {
                            NoteListRowFactory.make(note: item)
                        }
                    }
                }
            }
            .navigationBarTitle(Strings.NoteList.pageTitle)
            .navigationBarItems(trailing: rightBarButton)
            .createNote($viewModel.isShowingNoteCreationView)
        }
        .alert(isPresented: $viewModel.isShowingAlert) {
            Alert(title: Text(viewModel.alertTitle),
                  message: Text(viewModel.alertMessage))
        }
        .onAppear(perform: viewModel.onAppear)
    }

    private var rightBarButton: Button<Text> {
        Button<Text>(Strings.NoteList.rightBarButton, action: viewModel.toggleShowingCreationView)
    }
}
