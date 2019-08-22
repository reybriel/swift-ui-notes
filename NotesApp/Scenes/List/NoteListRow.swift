import SwiftUI

// MARK: - Constants

private enum Constants {
    static let lineLimit: Int = 1
}

// MARK: - Row View

struct NoteListRow: View {
    
    // MARK: Properties
    
    private let note: NoteViewModel
    
    // MARK: Body
    
    var body: some View {
        self.declareContentWrapperView(
            for: VStack(alignment: .leading) {
                Text(note.title)
                Spacer()
                Text(note.content)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(Constants.lineLimit)
            }
        )
    }
    
    // MARK: Wrapper Views
    
    private func declareContentWrapperView<ContentView: View>(for view: ContentView) -> some View {
        HStack {
            view
            Spacer()
        }
        .padding()
    }
    
    // MARK: Initializers
    
    init(note: NoteViewModel) {
        self.note = note
    }
}
