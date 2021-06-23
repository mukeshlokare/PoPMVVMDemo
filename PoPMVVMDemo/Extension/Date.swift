//
//  Date.swift
//  plexigo
//
//  Created by Mukesh Lokare on 06/12/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation
class SimpleFormator {
    static var dateFormatter: DateFormatter  = DateFormatter()
    static let kServer12Format = "yyyy-MM-dd'T'hh:mm:ss"
    static let kServer24Format = "yyyy-MM-dd'T'HH:mm:ss"
    static let kServer24TimeStampFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    static let kDayMonthYearFormat = "dd/MM/yyyy"
    static let kProfileUpdateFormat = "yyyy-MM-dd"
    static let day = "dd"
    static let dayName = "EEE"
    static let fullDayName = "EEEE"
    static let monthName = "MMM"
    static let dayMonth = "MMM dd, EEE 'at' HH:mm a"
    static let dayMonthYear = "MMM dd, EEE"
    static let bookingFormat = "MMMM dd, yyyy"
    static let notificationFormat = "dd MMMM,yyyy"
    static func dateFromString(_ string: String,dateFormat: String?, alternateFormat: String?) -> Date? {
        dateFormatter.dateFormat = dateFormat
        if let date = dateFormatter.date(from: string) {
            return date
        }
        dateFormatter.dateFormat = alternateFormat
        return dateFormatter.date(from: string)
    }
     
    static func dateStringFromDate(_ date: Date,dateFormat: String) -> String {
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: date)
    }
    static func toLocalTime(date:Date, dateFormat: String?) -> String {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: date))
        let localDT = Date(timeInterval: seconds, since: date)
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: localDT)
    }
    
}
extension Date {
    
    var age: Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    }
    
    var millisecondsSince1970: Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds: Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
    
    func adding(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
    
    func differnceBetweenDates() -> DateComponents {
        let components = Calendar.current.dateComponents([.day, .hour, .minute, .second],
                                                         from: Date(),
                                                         to: self)
        return components
    }
}
extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
}
