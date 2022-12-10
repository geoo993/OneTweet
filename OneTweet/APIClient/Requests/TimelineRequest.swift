import Foundation

struct TimelineRequest: DataRequest {
    typealias ResponseObject = APIClient.Timeline
    typealias ErrorObject = APIError
    
    let fileUrl: URL? = Bundle.main.url(
        forResource: "Timeline",
        withExtension: "json"
    )
}
