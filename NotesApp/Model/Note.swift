import Foundation

typealias NoteViewModel = Note.ViewModel

struct Note {
    let id: String
    let title: String
    let content: String?
    let creationDate: Date
    let lastEditDate: Date
}

extension Note {
    struct ViewModel: Identifiable {
        var id: String
        var title: String
        var content: String
    }

    var viewModel: ViewModel {
        ViewModel(id: id,
                  title: title,
                  content: content ?? ""
        )
    }
}
