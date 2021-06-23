//
//  Date+TimeLeft.swift
//  plexigo
//
//  Created by Mukesh Lokare on 13/07/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation
import UIKit

extension Date {
  
  private struct Constants {
     static let curvatureRadius = CGFloat(8.0)
     static let expiredText = "expired"
  }

    
  private static let second = 1.0
  private static let minute = (second * 60)
  private static let hour   = (minute * 60)
  private static let day    = (hour * 24)
  private static let week   = (day * 7)
  
  var formattedAsTimeLeft: String {
    // Less than 1h
    if timeIntervalSinceNow < Date.minute {
      return formattedAsMinutes
      
    // Between 1h and 23h 59m 59s
    } else if timeIntervalSinceNow >= Date.minute && timeIntervalSinceNow < Date.day {
      return formattedAsHours
      
    // Between 1d and 6d 23h 59m 59s
    } else if timeIntervalSinceNow >= Date.day && timeIntervalSinceNow < Date.week {
      return formattedAsDays
    }
    
    // 7d or later
    return formattedAsWeeks
  }

  func formattedAsTimeLeftInComponents(_ components: [Calendar.Component]) -> DateComponents {
    let dateStart = Date()
    let dateRangeEnd = self
    return Calendar.current.dateComponents(Set(components), from: dateStart, to: dateRangeEnd)
  }
  
  private var formattedAsMinutes: String {
    let minutes = Int(timeIntervalSinceNow / Date.minute)
    if minutes < 0{
        return Constants.expiredText
    }
    return "\(minutes)m left" // TODO: Localize        // pending
  }
  
  private var formattedAsHours: String {
    let hours = Int(timeIntervalSinceNow / Date.hour)
    if hours < 0{
        return Constants.expiredText
    }
    return "\(hours)h left" // TODO: Localize          // pending
  }
  
  private var formattedAsDays: String {
    let days = Int(timeIntervalSinceNow / Date.day)
    if days < 0{
        return Constants.expiredText
    }
    return "\(days)d left" // TODO: Localize      // pending
  }
  
  private var formattedAsWeeks: String {
    let weeks = Int(timeIntervalSinceNow / Date.week)
    if weeks < 0{
        return Constants.expiredText
    }
    return "\(weeks)w left" // TODO: Localize          // pending
  }
  
}
