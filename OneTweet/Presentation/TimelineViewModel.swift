import Foundation

final class TimelineViewModel: ObservableObject {
    private let repository: TimelineRepositoryInterface
    
    @Published var showErrorMessage = false
    @Published var tweets: [Tweet] = []
    
    init(repository: TimelineRepositoryInterface = TimelineRepository()) {
        self.repository = repository
    }
    
    func getTweets() {
        let results = repository.getTimeline().map(\.tweets)
        switch results {
        case let .success(values):
            tweets = values
            showErrorMessage = false
        case .failure:
            showErrorMessage = true
        }
    }
    
    func dismissMessage() {
        showErrorMessage = false
    }
}
