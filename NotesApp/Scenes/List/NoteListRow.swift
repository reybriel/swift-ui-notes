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

    private var borderOverlay: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .stroke(Color.gray)
            .opacity(Constants.borderOpacity)
    }
    
    // MARK: Body
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.headline)
                    .foregroundColor(Color("HeadlineColor"))
                Spacer()
                Text(note.content)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(Constants.lineLimit)
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding()
        .overlay(borderOverlay)
    }
}
