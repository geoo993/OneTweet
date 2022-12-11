import Foundation

extension Timeline {
    static func fixture(
        tweets: [Tweet] = [.fixture()]
    ) -> Self {
        self.init(tweets: tweets)
    }
}

extension Tweet {
    static func fixture(
        content: Content = .fixture(),
        replies: [Tweet] = []
    ) -> Self {
        self.init(content: content, replies: replies)
    }
}

extension Content {
    static func fixture(
        id: String = "usnjs",
        name: String = "Steve",
        author: String = "@steve",
        message: String = "hello @steve",
        avatar: URL? = URL(string: "https://hws.dev/paul.jpg"),
        date: Date = Date(timeIntervalSinceNow: -18030)
    ) -> Self {
        self.init(
            id: id,
            name: name,
            author: author,
            message: message,
            avatar: avatar,
            date: date
        )
    }
}
