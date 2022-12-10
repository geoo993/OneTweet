import Foundation

public extension DateFormatter {
    static func dateWithTime(
        locale: Locale = .autoupdatingCurrent,
        timeZone: TimeZone = .autoupdatingCurrent
    ) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.timeZone = timeZone
        formatter.locale = locale
        return formatter
    }
}
