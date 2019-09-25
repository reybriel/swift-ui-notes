import SwiftUI

struct NoteListRow: View {
    static let lineLimit: Int = 1

    let note: NoteViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.headline)
                    .foregroundColor(.headline)
                Spacer()
                Text(note.content.isEmpty ? Strings.NoteList.emptyContentPlaceholder : note.content)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(NoteListRow.lineLimit)
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding()
        .background(Color.major)
        .cornerRadius(Sizes.cornerRadius)
        .shadow(radius: Sizes.shadowRadius, x: Sizes.shadowXOffset, y: Sizes.shadowYOffset)
    }
}
