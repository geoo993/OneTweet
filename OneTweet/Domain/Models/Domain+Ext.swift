import Foundation

extension Timeline {
    init(model: APIClient.Timeline) {
        let replies = model.tweets.filter { $0.replyId != nil }
        let mainTweets = model.tweets.filter { $0.replyId == nil }
        self.init(tweets: mainTweets.map { Tweet.addReplies(of: $0, replies: replies)})
    }
}

extension Tweet {
    static func addReplies(of tweet: APIClient.Tweet, replies: [APIClient.Tweet]) -> Tweet {
        if replies.contains(where: { $0.replyId == tweet.id }) {
            let tweetReplies = replies.filter { $0.replyId == tweet.id }
            let remainders = replies.filter { $0.replyId != tweet.id }
            return Tweet(
                content: Content(model: tweet),
                replies: tweetReplies.map { addReplies(of: $0, replies: remainders) }
            )
        } else {
            return Tweet(content: Content(model: tweet), replies: [])
        }
    }
}

extension Content {
    init(model: APIClient.Tweet) {
        self.init(
            id: model.id,
            name: model.name,
            author: model.author,
            message: model.content,
            avatar: {
                guard let value = model.avatar else { return nil }
                return URL(string: value)
            }(),
            date: model.date
        )
    }
}
