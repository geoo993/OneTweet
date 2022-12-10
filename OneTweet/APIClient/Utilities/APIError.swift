import Foundation

enum APIError: Swift.Error, Equatable {
    case unknown
    case invalidUrlPath
    case decodingError(String)

    var localizedDescription: String {
        switch self {
        case .unknown: return "Unknown"
        case .invalidUrlPath: return "We encountered an error with url path"
        case .decodingError(let description): return "Failed to decode data: \(description)"
        }
    }
}
