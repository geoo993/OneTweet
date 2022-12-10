import Foundation
import XCTest
@testable import OneTweet

final class TimelineRequestTests: XCTestCase {
    func testRequest() {
        let apiClient = APIClient()
        let result = apiClient.execute(request: TimelineRequest())
        var output: APIClient.Timeline?
        switch result {
        case let .success(value):
            output = value
        case let .failure(error):
            XCTFail(error.localizedDescription)
        }
        XCTAssertEqual(output?.tweets.count, 7)
    }
}
