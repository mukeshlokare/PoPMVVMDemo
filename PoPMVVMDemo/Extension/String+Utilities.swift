//
//  String+.swift
//  plexigo
//
//  Created by Mukesh Lokare on 13/07/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation

extension String {
  
  var firstUppercased: String {
    guard let first = first else { return "" }
    return String(first).uppercased() + dropFirst()
  }
  
  var isNumeric: Bool {
      return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
  }
  
  var numericOnly: String {
    return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
  }
  
  var trimmed: String {
    return trimmingCharacters(in: .whitespacesAndNewlines)
  }
  
  var nullifiedIfEmpty: String? {
    return isEmpty ? "" : self
  }
  
  var urlEscapedString: String {
    return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
  }
  
  var utf8Encoded: Data {
    return data(using: .utf8)!
  }
  
  var possessiveForm: String {
    if let lastChar = last, String(lastChar) == "s" {
      return self + "'"
    }
    return self + "'s"
  }
  
  var byAddingHTTPPrefixIfNeeded: String {
    if self.hasPrefix("http://") || self.hasPrefix("https://") {
      return self
    } else {
      return "http://" + self
    }
  }
  
  var withoutHtmlTags: String {
    return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil).replacingOccurrences(of: "&[^;]+;", with: "", options:.regularExpression, range: nil)
  }
  


    func lastOccurrenceOfString(string: String) -> String.Index? {
        let characterSet = CharacterSet(charactersIn: string)
        if let range = rangeOfCharacter(from: characterSet, options: .backwards) {
            let offsetBy = distance(from: startIndex, to: range.upperBound)
            
            return index(startIndex, offsetBy: offsetBy)
        }
        
        return nil
    }
    
    func boolValue() -> Bool? {
        let trueValues = ["true", "yes", "1", "y", "Y"]
        let falseValues = ["false", "no", "0", "n", "N"]

        let lowerSelf = self.lowercased()

        if trueValues.contains(lowerSelf){
            return true
        } else if falseValues.contains(lowerSelf) {
            return false
        } else {
            return nil
        }
    }
    
    var youtubeID: String? {
        let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"
        
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: count)
        
        guard let result = regex?.firstMatch(in: self, range: range) else {
            return nil
        }
        
        return (self as NSString).substring(with: result.range)
    }
}
