import SwiftUI

// MARK: - Constants

private enum Constants {
    static let lineLimit: Int = 1
}

// MARK: - Row View

struct NoteListRow: View {
    
    // MARK: Properties
    
    let note: NoteViewModel
    
    // MARK: Body
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(note.title)
                Spacer()
                Text(note.content)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(Constants.lineLimit)
            }
        }
        .padding()
    }
}
