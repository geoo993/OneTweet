import Foundation
import XCTest
@testable import OneTweet

final class TimelineRequestTests: XCTestCase {
    func testRequest() {
        let apiClient = APIClient()
        let result = apiClient.execute(request: TimelineRequest())
        switch result {
        case let .success(value):
            XCTAssertEqual(value.tweets.count, 7)
        case let .failure(error):
            XCTFail(error.localizedDescription)
        }
    }
}
