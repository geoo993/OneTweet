import Foundation

struct Content: Hashable {
    let id: String
    let name: String
    let author: String
    let message: String
    let avatar: URL?
    let date: Date
}

extension Content {
    var authorAndTime: String {
        guard let timeAgoDate = date.timeAgoDisplay() else {
            return author
        }
        return "\(author) · \(timeAgoDate)"
    }
    
    var dayAndTime: String {
        let day = date.formatted(
            .dateTime
                .day()
                .month(.twoDigits)
                .year()
            )
        let time = date.formatted(
            .dateTime
                .hour(.conversationalDefaultDigits(amPM: .omitted))
                .minute()
            )
        return "\(time) · \(day)"
    }
    
    func formattedMessage(highlight text: String?) -> AttributedString {
        var attributedString = AttributedString(message)
        guard let value = text else {
            return attributedString
        }
        if let range = attributedString.range(of: value) {
            attributedString[range].foregroundColor = Assets.Color.primary
            attributedString[range].font = .init(.headline)
        }
        return attributedString
    }
}

struct Tweet: Hashable, Identifiable {
    var id: String { content.id }
    let content: Content
    let replies: [Tweet]
}
