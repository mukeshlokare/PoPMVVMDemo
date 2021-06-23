//
//  Bool+.swift
//  plexigo
//
//  Created by Mukesh Lokare on 13/07/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation

extension Bool {

  var dataValue: Data {
    var intValue = NSNumber(value: self).intValue
    return Data(bytes: &intValue, count: MemoryLayout.size(ofValue: intValue))
  }
  
}
