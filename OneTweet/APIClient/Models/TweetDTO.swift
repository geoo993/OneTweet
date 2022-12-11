import Foundation

extension APIClient {
    public struct Tweet: Decodable {
        let id: String
        let replyId: String?
        let name: String
        let author: String
        let content: String
        let avatar: String?
        let date: Date
    }
}

extension APIClient.Tweet {
    enum CodingKeys: String, CodingKey {
        case id, name, author, content, avatar, date
        case replyId = "inReplyTo"
    }
}
