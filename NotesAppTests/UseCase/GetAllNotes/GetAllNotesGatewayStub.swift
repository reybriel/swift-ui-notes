@testable
import NotesApp

import class Combine.Future

final class GetAllNotesGatewayStub: GetAllNotesGateway {
    private var result: Result<[Note], Error> = .failure(TestError())

    func returnError() {
        result = .failure(TestError())
    }

    func returnMock() {
        result = .success(Note.mocks)
    }

    func returnEmpty() {
        result = .success([])
    }

    func createRequestUpstream() -> Future<[Note], Error> {
        Future { completion in
            completion(self.result)
        }
    }
}
