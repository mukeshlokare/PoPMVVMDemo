//
//  Date+UTC.swift
//  plexigo
//
//  Created by Mukesh Lokare on 13/07/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation

extension Date {
  func convertToUTC() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss ZZZ"
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    return formatter.string(from: self)
  }
}
