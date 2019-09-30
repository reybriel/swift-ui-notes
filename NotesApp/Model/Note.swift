import struct Foundation.Date

struct Note {
    let id: String
    let title: String
    let content: String?
    let creationDate: Date
    let lastEditDate: Date
}
