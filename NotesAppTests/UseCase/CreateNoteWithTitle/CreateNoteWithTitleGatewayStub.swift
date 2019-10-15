@testable
import NotesApp

import class Combine.Future

final class CreateNoteWithTitleGatewayStub: CreateNoteWithTitleGateway {
    private var result: Result<Void, Error> = .failure(TestError())

    func returnError() {
        result = .failure(TestError())
    }

    func returnSuccess() {
        result = .success(())
    }

    func createSaveUpstream(noteTitle: String) -> Future<Void, Error> {
        Future { completion in
            completion(self.result)
        }
    }
}
