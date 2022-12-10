@testable import OneTweet

final class MockAPIClient: APIClientRequestable {
    var executeCalled = false
    var executeCallback: ((_ request: Any) -> Result<Any,APIError>)?
    
    func execute<T: DataRequest, V: Decodable>(
        request: T
    ) -> Result<V, T.ErrorObject>
    where T.ResponseObject == V, T.ErrorObject == APIError {
        executeCalled = true
        guard let callback = executeCallback else {
            return .failure(APIError.unknown)
        }
        let result = callback(request)
        switch result {
        case let .success(value as V):
            return .success(value)
        case let .failure(error):
            return .failure(error)
        default:
            return .failure(APIError.unknown)
        }
    }
}
