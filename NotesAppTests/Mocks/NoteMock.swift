@testable
import NotesApp

import Foundation.NSDate

extension Note {
    static var mock: Note {
        let date = Date(timeIntervalSinceNow: -1000)
        return Note(id: "4",
             title: "Single",
             content: "So alone!",
             creationDate: date,
             lastEditDate: date)
    }

    static var mocks: [Note] {
        let date1 = Date(timeIntervalSinceNow: -32000)
        let date2 = Date(timeInterval: -10000, since: date1)
        let date3 = Date(timeInterval:  -8000, since: date2)
        return [
            Note(id: "1",
            title: "First note",
            content: "First note content",
            creationDate: date1,
            lastEditDate: date1),
            Note(id: "2",
            title: "Second note",
            content: "Second note content",
            creationDate: date2,
            lastEditDate: date2),
            Note(id: "3",
            title: "Thrid note",
            content: "Unpredictable content",
            creationDate: date3,
            lastEditDate: date3)
        ]
    }
}
