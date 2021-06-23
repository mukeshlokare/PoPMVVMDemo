//
//  String+Substring.swift
//  plexigo
//
//  Created by Mukesh Lokare on 13/07/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation

extension String {
  subscript (i: Int) -> Character {
    return self[index(startIndex, offsetBy: i)]
  }
  
  subscript (bounds: CountableRange<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[start ..< end]
  }
  
  subscript (bounds: CountableClosedRange<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[start ... end]
  }
  
  subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(endIndex, offsetBy: -1)
    return self[start ... end]
  }
  
  subscript (bounds: PartialRangeThrough<Int>) -> Substring {
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[startIndex ... end]
  }
  
  subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[startIndex ..< end]
  }
}

extension Substring {
  subscript (i: Int) -> Character {
    return self[index(startIndex, offsetBy: i)]
  }
  
  subscript (bounds: CountableRange<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[start ..< end]
  }
  
  subscript (bounds: CountableClosedRange<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[start ... end]
  }
  
  subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(endIndex, offsetBy: -1)
    return self[start ... end]
  }
  
  subscript (bounds: PartialRangeThrough<Int>) -> Substring {
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[startIndex ... end]
  }
  
  subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[startIndex ..< end]
  }
}
extension String {
    func countInstances(of stringToFind: String) -> Int {
        var stringToSearch = self
        var count = 0
        while let foundRange = stringToSearch.range(of: stringToFind, options: .diacriticInsensitive) {
            stringToSearch = stringToSearch.replacingCharacters(in: foundRange, with: "")
            count += 1
        }
        return count
    }
    
    var stripped: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-=().!_")
        return self.filter {okayChars.contains($0) }
    }
}
