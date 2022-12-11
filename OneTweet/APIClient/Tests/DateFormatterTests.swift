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
    
    func testSecondsAgoDate() {
        let date = Date(timeIntervalSinceNow: 10000)
        let current = Date(timeIntervalSinceNow: 10001)
        XCTAssertEqual(date.timeAgoDisplay(from: current), "1s")
    }
    
    func testMinutesAgoDate() {
        let date = Date(timeIntervalSinceNow: 10000)
        let current = Date(timeIntervalSinceNow: 10100)
        XCTAssertEqual(date.timeAgoDisplay(from: current), "1m")
    }
    
    func testHoursAgoDate() {
        let date = Date(timeIntervalSinceNow: 10000)
        let current = Date(timeIntervalSinceNow: 14000)
        XCTAssertEqual(date.timeAgoDisplay(from: current), "1h")
    }
    
    func testDaysAgoDate() {
        let date = Date(timeIntervalSinceNow: 10000)
        let current = Date(timeIntervalSinceNow: 100000)
        XCTAssertEqual(date.timeAgoDisplay(from: current), "1d")
    }
    
    func testWeeksAgoDate() {
        let date = Date(timeIntervalSinceNow: 10000)
        let current = Date(timeIntervalSinceNow: 1000000)
        XCTAssertEqual(date.timeAgoDisplay(from: current), "1w")
    }
}
