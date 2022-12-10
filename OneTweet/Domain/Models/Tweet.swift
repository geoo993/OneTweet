import Foundation

struct Tweet: Hashable {
    let id: String
    let replyId: String?
    let author: String
    let content: String
    let avatar: URL?
    let date: Date
}

extension Tweet {
    static func fixture(
        id: String = "usnjs",
        author: String = "name",
        content: String = "hello world",
        avatar: URL? = URL(string: "https://hws.dev/paul.jpg"),
        date: Date = Date()
    ) -> Self {
        self.init(
            id: id,
            replyId: nil,
            author: author,
            content: content,
            avatar: avatar,
            date: date
        )
    }
}
