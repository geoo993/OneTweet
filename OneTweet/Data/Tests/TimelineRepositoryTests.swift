import XCTest
@testable import OneTweet

final class TimelineRepositoryTests: XCTestCase {
    private var apiClient: MockAPIClient!
    private var repository: TimelineRepository!
    
    override func setUp() {
        apiClient = MockAPIClient()
        repository = TimelineRepository(apiClient: apiClient)
    }

    override func tearDown() {
        apiClient = nil
        repository = nil
        super.tearDown()
    }
    
    func testGetTimeline() async throws {
        apiClient.executeCallback = {
            guard $0 is TimelineRequest else {
                throw APIError.unknown
            }
            return APIClient.Timeline(
                tweets: [
                        .init(id: "sjjs", replyId: nil, name: "", author: "", content: "", avatar: nil, date: .init())
                ]
            )
        }
        XCTAssertFalse(apiClient.executeCalled)
        let result = try await repository.getTimeline()
        XCTAssertEqual(result.tweets.count, 1)
        XCTAssertEqual(result.tweets.first?.id, "sjjs")
        XCTAssertTrue(apiClient.executeCalled)
    }
}
