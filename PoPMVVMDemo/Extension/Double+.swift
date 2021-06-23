//
//  Double+.swift
//  plexigo
//
//  Created by Mukesh Lokare on 13/07/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation

extension Double {
  
  var withCommas: String {
    let numberFormatter = NumberFormatter()
    numberFormatter.locale = Locale(identifier: "en_US")
    numberFormatter.numberStyle = NumberFormatter.Style.decimal
//    numberFormatter.minimumFractionDigits = 2
//    numberFormatter.maximumFractionDigits = 2
    return numberFormatter.string(from: NSNumber(value:self)) ?? String(self)
  }
    
  func toInt() -> Int? {
    if self >= Double(Int.min) && self < Double(Int.max) {
        return Int(self)
    } else {
        return nil
    }
  }
}
