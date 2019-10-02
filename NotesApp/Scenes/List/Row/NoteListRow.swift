import SwiftUI

struct NoteListRow: View {
    static let lineLimit: Int = 1

    let viewModel: NoteListRowModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.noteTitle)
                    .font(.headline)
                Spacer()
                Text(viewModel.isShowingContent ? viewModel.noteContent : Strings.NoteList.Row.emptyContentMessage)
                    .font(.subheadline).italic().foregroundColor(.gray)
                    .lineLimit(NoteListRow.lineLimit)
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding()
    }
}
