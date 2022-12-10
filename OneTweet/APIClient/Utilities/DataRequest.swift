import Foundation

protocol DataRequest {
    var fileUrl: URL? { get }
    associatedtype ResponseObject: Any
    associatedtype ErrorObject: Error
}
