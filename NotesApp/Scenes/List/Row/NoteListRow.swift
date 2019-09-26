import SwiftUI

struct NoteListRow: View {
    static let lineLimit: Int = 1

    let viewModel: NoteListRowModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.noteTitle)
                    .font(.headline)
                if viewModel.isShowingContent {
                    Spacer()
                    Text(viewModel.noteContent)
                        .font(.subheadline).italic()
                        .lineLimit(NoteListRow.lineLimit)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding()
    }
}
