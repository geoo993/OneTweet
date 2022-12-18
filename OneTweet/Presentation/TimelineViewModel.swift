import Foundation

@MainActor
final class TimelineViewModel: ObservableObject {
    private let repository: TimelineRepositoryInterface
    
    @Published var showErrorMessage = false
    @Published var tweets: [Tweet] = []
    
    init(repository: TimelineRepositoryInterface = TimelineRepository()) {
        self.repository = repository
    }

    func getTweets() async {
        do {
            let timeline = try await repository.getTimeline()
            tweets = timeline.tweets
            showErrorMessage = false
        } catch {
            showErrorMessage = true
        }
    }
    
    func dismissMessage() {
        showErrorMessage = false
    }
}
