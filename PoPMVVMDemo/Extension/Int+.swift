//
//  Int+.swift
//  plexigotv
//
//  Created by Mukesh Lokare on 08/12/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation
extension Int {
  
  var boolValue: Bool { return self != 0 }
    
  var withCommas: String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = NumberFormatter.Style.decimal
    return numberFormatter.string(from: NSNumber(value:self)) ?? String(self)
  }
  
  func shortValue() -> String {
    if self < 1_000 {
      return "\(self)"
    } else if self < 1_000_000 {
      let value = Double(self) / 1_000.0
      
      let decimalPlaces = 1.0
      let multiplier = pow(10.0, decimalPlaces)
      let roundedValue = floor(value * multiplier) / multiplier
      
      let hasDecimal = roundedValue.truncatingRemainder(dividingBy: 1) != 0
      return hasDecimal ? String(format: "%.1fK", roundedValue) : "\(Int(roundedValue))K"
    } else {
      let value = Double(self) / 1_000_000.0
      
      let decimalPlaces = 2.0
      let multiplier = pow(10.0, decimalPlaces)
      let roundedValue = floor(value * multiplier) / multiplier
      
      let hasDecimal = roundedValue.truncatingRemainder(dividingBy: 1) != 0
      return hasDecimal ? String(format: "%.2fM", roundedValue) : "\(Int(roundedValue))M"
    }
  }
    
  func roundedShortValue() -> String {
    
    if self < 1_000 {
        return "\(self)"
    } else if self < 1_000_000 {
        let value1 = Double(self) / 1_000.0
        let reminder = Double(self).remainder(dividingBy: 1_000)
        if reminder != 0 {
            return "\(Double(value1))K"
        }else{
            return "\(Int(value1))K"
        }
    } else {
        
        let input = Double(self)
        let value1 = input / 1_000_000.0
        let reminder = input.remainder(dividingBy: 1_000_000.0)
        let decimalPlaces = 3.0
        let multiplier = pow(10.0, decimalPlaces)
        if reminder != 0 {
            let roundedValue = Double(round(multiplier*value1)/multiplier)
            let decimalValueReminder = roundedValue.remainder(dividingBy: 100)
            if decimalValueReminder != 0{
                return "\(Double(roundedValue))M"
            }else{
                return "\(Int(roundedValue))M"
            }
        }else{
            return "\(Int(value1))M"
        }
    }
  }
}
