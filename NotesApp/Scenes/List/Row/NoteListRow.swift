import SwiftUI

// MARK: - Constants

private enum Constants {
    static let lineLimit: Int = 1
    static let cornerRadius: CGFloat = 8.0
    static let borderOpacity: Double = 0.3
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
                    .font(.headline)
                    .foregroundColor(.headline)
                Spacer()
                Text(note.content.isEmpty ? "..." : note.content)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(Constants.lineLimit)
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding()
        .background(Color.major)
        .cornerRadius(Constants.cornerRadius)
        .shadow(radius: 1.0, x: -1, y: 1)
    }
}
