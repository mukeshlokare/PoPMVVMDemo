//
//  Date+TimeRemaining.swift
//  plexigo
//
//  Created by Mukesh Lokare on 13/07/20.
//  Copyright © 2020 neosoft. All rights reserved.
//
import Foundation

extension Date {
  
  func formattedAsTimeRemaining(style: TimeAgoStyle = .short, toDate: Date = Date()) -> String {
    let components: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year]
    let dateComponents = Calendar.current.dateComponents(components, from: self, to: toDate)
    let minuteDiff = dateComponents.minute ?? 0
    let hourDiff   = dateComponents.hour ?? 0
    let dayDiff    = dateComponents.day ?? 0
    let weekDiff   = dateComponents.weekOfYear ?? 0
    let monthDiff  = dateComponents.month ?? 0
    let yearDiff   = dateComponents.year ?? 0
    
    if yearDiff > 0 {
      return "\(monthDiff)\(style.separator)\(style.years(singular: monthDiff == 1))"
    } else if monthDiff > 0 && style == .long {
      return "\(monthDiff)\(style.separator)\(style.months(singular: monthDiff == 1))"
    } else if weekDiff > 0 {
      return "\(weekDiff)\(style.separator)\(style.weeks(singular: weekDiff == 1))"
    } else if dayDiff > 0 {
      return "\(dayDiff)\(style.separator)\(style.days(singular: dayDiff == 1))"
    } else if hourDiff > 0 {
      return "\(hourDiff)\(style.separator)\(style.hours(singular: hourDiff == 1))"
    } else if minuteDiff > 0 {
      return "\(minuteDiff)\(style.separator)\(style.minutes(singular: minuteDiff == 1))"
    } else {
      return style.lessThanAMinute()
    }
  }
  
}

