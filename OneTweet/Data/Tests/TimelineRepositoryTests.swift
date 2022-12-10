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
    
    func testGetTimeline() {
        apiClient.executeCallback = {
            guard $0 is TimelineRequest else {
                return .failure(.unknown)
            }
            return .success(
                APIClient.Timeline(
                    tweets: [
                        .init(id: "sjjs", replyId: nil, author: "", content: "", avatar: nil, date: .init())
                    ]
                )
            )
        }
        XCTAssertFalse(apiClient.executeCalled)
        let result = repository.getTimeline()
        switch result {
        case let .success(value):
            XCTAssertEqual(value.tweets.count, 1)
            XCTAssertEqual(value.tweets.first?.id, "sjjs")
        case let .failure(error):
            XCTFail(error.localizedDescription)
        }
        XCTAssertTrue(apiClient.executeCalled)
    }
}
