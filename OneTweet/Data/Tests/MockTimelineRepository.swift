@testable import OneTweet

final class MockTimelineRepository: TimelineRepositoryInterface {
    private let timeline: Result<Timeline, Error>
    
    init(timeline: Result<Timeline, Error> = .success(.fixture())) {
        self.timeline = timeline
    }

    func getTimeline() -> Result<Timeline, Error> {
        timeline
    }
}
