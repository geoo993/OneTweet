import XCTest
@testable import OneTweet

final class TimelineViewModelTests: XCTestCase {
    private var sut: TimelineViewModel!

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testGetTweetsSucceeds() async throws {
        let timeline: Timeline = .fixture(
            tweets: [
                .fixture(content: .fixture(id: "73839")),
                .fixture(content: .fixture(id: "73ss839")),
                .fixture(content: .fixture(id: "2334"), replies: [
                    .fixture(content: .fixture(id: "ss4399"))
                ])
            ]
        )
        sut = TimelineViewModel(
            repository: MockTimelineRepository(timeline: .success(timeline))
        )
        await sut.getTweets()
        XCTAssertEqual(sut.tweets.count, 3)
        XCTAssertEqual(sut.tweets.last?.replies.count, 1)
    }
    
    func testGetTweetsFails() async throws {
        sut = TimelineViewModel(
            repository: MockTimelineRepository(timeline: .failure(APIError.unknown))
        )
        await sut.getTweets()
        XCTAssertEqual(sut.tweets.count, 0)
        XCTAssertTrue(sut.showErrorMessage)
    }
}
