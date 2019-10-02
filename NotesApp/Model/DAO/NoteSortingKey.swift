import class Foundation.NSSortDescriptor

struct NoteSortingKey {
    let name: String
    let ascending: Bool

    func createSortDescriptor() -> NSSortDescriptor {
        NSSortDescriptor(key: name, ascending: ascending)
    }

    static var `default`: NoteSortingKey {
        .creationDateDescending
    }

    static let creationDateDescending: NoteSortingKey = .init(name: "creationDate", ascending: false)
}
