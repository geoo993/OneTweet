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

extension Date {
    // TODO: could have used RelativeDateTimeFormatter
    public func timeAgoDisplay(from now: Date = Date()) -> String? {
        let calendar = Calendar.current
        guard
            let minuteAgo = calendar.date(byAdding: .minute, value: -1, to: now),
            let hourAgo = calendar.date(byAdding: .hour, value: -1, to: now),
            let dayAgo = calendar.date(byAdding: .day, value: -1, to: now),
            let weekAgo = calendar.date(byAdding: .day, value: -7, to: now),
            let yearAgo = calendar.date(byAdding: .year, value: -1, to: now)
        else { return nil }
        if minuteAgo < self {
            let diff = Calendar.current.dateComponents([.second], from: self, to: now).second ?? 0
            return "\(diff)s"
        } else if hourAgo < self {
            let diff = Calendar.current.dateComponents([.minute], from: self, to: now).minute ?? 0
            return "\(diff)m"
        } else if dayAgo < self {
            let diff = Calendar.current.dateComponents([.hour], from: self, to: now).hour ?? 0
            return "\(diff)h"
        } else if weekAgo < self {
            let diff = Calendar.current.dateComponents([.day], from: self, to: now).day ?? 0
            return "\(diff)d"
        } else if yearAgo < self {
            let diff = Calendar.current.dateComponents([.weekOfYear], from: self, to: now).weekOfYear ?? 0
            return "\(diff)w"
        } else {
            let diff = Calendar.current.dateComponents([.year], from: self, to: now).year ?? 0
            return "\(diff)y"
        }
    }
}
