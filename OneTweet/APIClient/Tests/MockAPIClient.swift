@testable import OneTweet

final class MockAPIClient: APIClientRequestable {
    var executeCalled = false
    var executeCallback: ((_ request: Any) async throws -> Any)?
    
    func execute<T: DataRequest, V: Decodable>(
        request: T
    ) async throws -> V where T.ResponseObject == V {
        executeCalled = true
        guard
            let callback = executeCallback,
            let result = try await callback(request) as? V
        else {
            throw APIError.unknown
        }
        return result 
    }
}
