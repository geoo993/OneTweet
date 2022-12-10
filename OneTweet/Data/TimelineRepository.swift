import Foundation

protocol TimelineRepositoryInterface {
    func getTimeline() -> Result<Timeline, Error>
}

final class TimelineRepository: TimelineRepositoryInterface {
    private let apiClient: APIClientRequestable
    
    init(apiClient: APIClientRequestable = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getTimeline() -> Result<Timeline, Error> {
        apiClient
            .execute(request: TimelineRequest())
            .map(Timeline.init)
            .mapError { $0 }
    }
}
