import Foundation

protocol APIClientRequestable {
    func execute<T: DataRequest, V: Decodable>(
        request: T
    ) async throws -> V where T.ResponseObject == V
}

final class APIClient: APIClientRequestable {
    func execute<T: DataRequest, V: Decodable>(
        request: T
    ) async throws -> V where T.ResponseObject == V {
        guard let url = request.fileUrl  else {
            throw APIError.invalidUrlPath
        }
        let data = try Data(contentsOf: url)
        let result = try JSONDecoder.dateFormatter().decode(V.self, from: data)
        return result
    }
}
