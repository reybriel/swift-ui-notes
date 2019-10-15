import XCTest
import struct Foundation.TimeInterval

class NotesTestCase: XCTestCase {

    func expect(_ expectation: XCTestExpectation, tolerance: TimeInterval = 0.02) {
        wait(for: [expectation], timeout: tolerance)
    }

    func fail(message: String = "") {
        XCTFail(message)
    }
}
