@testable import OneTweet

final class MockTimelineRepository: TimelineRepositoryInterface {
    private let timeline: Result<Timeline, Error>
    
    init(timeline: Result<Timeline, Error> = .success(.fixture())) {
        self.timeline = timeline
    }

    func getTimeline() async throws -> Timeline {
        switch timeline {
        case let .success(value):
            return value
        case let .failure(error):
            throw error
        }
    }
}
