import Foundation

typealias NoteViewModel = Note.ViewModel

enum Note {
    struct ViewModel: Identifiable {
        var id: String
        var title: String
        var content: String
    }
}

#if DEBUG

extension NoteViewModel {
    static let all: [NoteViewModel] = [
        
        .init(id: UUID().uuidString,
              title: "Chocolate Cake",
              content: "Ingredients: Chocolate, Sugar..."),
        
        .init(id: UUID().uuidString,
              title: "Shopping List",
              content: "Chocolate, Sugar, Salt...")
    ]
}

#endif
