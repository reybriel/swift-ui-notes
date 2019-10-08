@testable
import NotesApp

import Combine

final class UpdateNoteGatewayStub: UpdateNoteGateway {
    private var result: Result<NoteViewModel, Error> = .failure(TestError())

    func returnError() {
        result = .failure(TestError())
    }

    func returnMock() {
        result = .success(.mock)
    }

    func createUpdateSream(note: NoteViewModel) -> Future<NoteViewModel, Error> {
        Future { completion in
            completion(self.result)
        }
    }
}
