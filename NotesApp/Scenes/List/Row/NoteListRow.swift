import SwiftUI

struct NoteListRow: View {
    static let lineLimit: Int = 1

    let note: NoteViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.headline)
                if !note.content.isEmpty {
                    Spacer()
                    Text(note.content)
                        .font(.subheadline).italic()
                        .lineLimit(NoteListRow.lineLimit)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding()
    }
}
