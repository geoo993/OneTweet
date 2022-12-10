import XCTest
@testable import OneTweet

final class DateFormatterTests: XCTestCase {
    func testdateWithTimeSucceeds() throws {
        let dateString = "2020-09-30T09:41:00+0000"
        let timeZone = try XCTUnwrap(TimeZone(secondsFromGMT: 0))
        let locale = Locale(identifier: "en_US")
        let formatter = DateFormatter.dateWithTime(locale: locale, timeZone: timeZone)
        let date = try XCTUnwrap(formatter.date(from: dateString))
        let result = formatter.string(from: date)
        XCTAssertEqual(result, dateString)
    }

    func testdateWithTimeFails() throws {
        let dateString = "2020-09-30 09:41:00+0800"
        let timeZone = try XCTUnwrap(TimeZone(secondsFromGMT: 0))
        let locale = Locale(identifier: "en_US")
        let formatter = DateFormatter.dateWithTime(locale: locale, timeZone: timeZone)
        XCTAssertNil(formatter.date(from: dateString))
    }
}
