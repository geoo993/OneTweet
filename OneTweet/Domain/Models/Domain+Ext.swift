import Foundation

extension Tweet {
    init(model: APIClient.Tweet) {
        self.init(
            id: model.id,
            replyId: model.replyId,
            author: model.author,
            content: model.content,
            avatar: {
                guard let value = model.avatar else { return nil }
                return URL(string: value)
            }(),
            date: model.date
        )
    }
}
