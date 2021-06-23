//
//  NSMutableAttributedString+.swift
//  plexigo
//
//  Created by Mukesh Lokare on 13/07/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
  
  @discardableResult
  func setFont(_ font: UIFont, forFirstOccurrenceOf text: String) -> NSMutableAttributedString {
    let range = (string as NSString).range(of: text)
    if range.location != NSNotFound {
      let attributes = [NSAttributedString.Key.font: font]
      addAttributes(attributes, range: range)
    }
    return self
  }
}
