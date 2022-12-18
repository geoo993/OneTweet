import Foundation

protocol TimelineRepositoryInterface {
    func getTimeline() async throws -> Timeline
}

final class TimelineRepository: TimelineRepositoryInterface {
    private let apiClient: APIClientRequestable
    
    init(apiClient: APIClientRequestable = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getTimeline() async throws -> Timeline {
        let timeline = try await apiClient.execute(request: TimelineRequest())
        return Timeline(model: timeline)
    }
}
