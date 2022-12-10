import Foundation

struct Timeline: Hashable {
    let tweets: [Tweet]
}

extension Timeline {
    static func fixture(
        tweets: [Tweet] = [.fixture()]
    ) -> Self {
        self.init(tweets: tweets)
    }
}
