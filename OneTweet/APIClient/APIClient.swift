import Combine
import Foundation

protocol APIClientRequestable {
    func execute<T: DataRequest, V: Decodable>(
        request: T
    ) -> Result<V, T.ErrorObject>
    where T.ResponseObject == V, T.ErrorObject == APIError
}

final class APIClient: APIClientRequestable {
    func execute<T: DataRequest, V: Decodable>(
        request: T
    ) -> Result<V, T.ErrorObject>
    where T.ResponseObject == V, T.ErrorObject == APIError {
        guard let url = request.fileUrl  else {
            return .failure(APIError.invalidUrlPath)
        }
        do {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder.dateFormatter().decode(V.self, from: data)
            return .success(result)
        } catch {
            return .failure(APIError.decodingError(error.localizedDescription))
        }
    }
}
