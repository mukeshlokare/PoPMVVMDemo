//
//  String+Alphanumerics.swift
//  plexigo
//
//  Created by Mukesh Lokare on 13/07/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation

extension String {
  var isAlphaNumerics: Bool {
    if count > 0 {
      let allowedCharacters = CharacterSet.alphanumerics
    
      let unwantedStr = trimmingCharacters(in: allowedCharacters)
      return unwantedStr.count == 0
    }
    
    return true
  }
  
  var isAlphaNumericsAlsoSpace: Bool {
    if count > 0 {
      var allowedCharacters = CharacterSet.alphanumerics
      allowedCharacters.insert(charactersIn: " ")
      
      let unwantedStr = trimmingCharacters(in: allowedCharacters)
      return unwantedStr.count == 0
    }
    
    return true
  }
    
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && self.count > 5
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    public var validPhoneNumber: Bool {
        let types: NSTextCheckingResult.CheckingType = [.phoneNumber]
        guard let detector = try? NSDataDetector(types: types.rawValue) else { return false }
        if let match = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count)).first?.phoneNumber {
            return match == self
        } else {
            return false
        }
    }
}
