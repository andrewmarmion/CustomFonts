import XCTest
@testable import CustomFonts

final class CustomFontsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CustomFonts().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
