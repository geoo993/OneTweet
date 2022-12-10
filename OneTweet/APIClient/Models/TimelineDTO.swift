import Foundation

extension APIClient {
    public struct Timeline: Decodable {
        let tweets: [Tweet]
    }
}

extension APIClient.Timeline {
    enum CodingKeys: String, CodingKey {
        case tweets = "timeline"
    }
}
