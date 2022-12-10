import Foundation

extension APIClient {
    struct Timeline: Decodable {
        let tweets: [Tweet]
    }
}

extension APIClient.Timeline {
    enum CodingKeys: String, CodingKey {
        case tweets = "timeline"
    }
}
