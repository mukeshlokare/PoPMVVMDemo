//
//  TimeInterval+String.swift
//  plexigo
//
//  Created by Mukesh Lokare on 13/07/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation

extension TimeInterval {
  var formattedTimeDuration: String? {
    let formatter = DateComponentsFormatter()
    formatter.unitsStyle = .positional
    formatter.allowedUnits = [.minute, .second]
    formatter.zeroFormattingBehavior = [.pad]
    return formatter.string(from: self)
  }
}
