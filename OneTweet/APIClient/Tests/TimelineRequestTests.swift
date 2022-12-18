import Foundation
import XCTest
@testable import OneTweet

final class TimelineRequestTests: XCTestCase {
    func testRequest() async throws {
        let apiClient = APIClient()
        let result = try await apiClient.execute(request: TimelineRequest())
        XCTAssertEqual(result.tweets.count, 7)
    }
}
