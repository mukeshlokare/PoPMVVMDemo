//
//  ViewReusable.swift
//  PoPMVVMDemo
//
//  Created by Mukesh Lokare on 13/07/20.
//  Copyright © 2020 neosoft. All rights reserved.
//


import Foundation
import UIKit

protocol ViewReusable {
  
  static var nibName: String { get }
  static var reuseIdentifier: String { get }
}

extension ViewReusable where Self: UIView {
  
  static var nibName: String {
    return String(describing: self)
  }
  
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}
