import Foundation

extension APIClient {
    struct Tweet: Decodable {
        let id: String
        let replyId: String?
        let author: String
        let content: String
        let avatar: String?
        let date: Date
    }
}

extension APIClient.Tweet {
    enum CodingKeys: String, CodingKey {
        case id, author, content, avatar, date
        case replyId = "inReplyTo"
    }
}
