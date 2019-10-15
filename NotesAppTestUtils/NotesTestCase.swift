import XCTest
import struct Foundation.TimeInterval

open class NotesTestCase: XCTestCase {

    public func expect(_ expression: Bool) {
        XCTAssertTrue(expression)
    }

    public func expect(_ expectation: XCTestExpectation, tolerance: TimeInterval = 0.02) {
        wait(for: [expectation], timeout: tolerance)
    }

    public func fail(message: String = "") {
        XCTFail(message)
    }
}
