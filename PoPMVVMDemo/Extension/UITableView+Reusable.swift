//
//  UITableView+Reusable.swift
//  plexigo
//
//  Created by Mukesh Lokare on 16/07/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import UIKit

extension UITableView {
  
  func register<T: ViewReusable>(view: T.Type, bundle: Bundle? = nil) {
    let nib = UINib(nibName: T.nibName, bundle: bundle)
    register(nib, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func register<T: ViewReusable>(headerFooterView: T.Type, bundle: Bundle? = nil) {
    let nib = UINib(nibName: T.nibName, bundle: bundle)
    register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
  }
  
  func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ViewReusable {
    guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
      fatalError("Unable to dequeue cell with identifier \(T.reuseIdentifier)")
    }
    return cell
  }
  
  func dequeueReusableHeaderFooterView<T>() -> T where T: ViewReusable {
    guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
      fatalError("Unable to dequeue header footer view with identifier \(T.reuseIdentifier)")
    }
    return view
  }
  
    func addDummyFooterView(_ height: CGFloat = 10, color: UIColor = UIColor.white) {
            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.height, height: height))
            footerView.backgroundColor = UIColor.clear
            let button = UIButton()
            button.frame = footerView.frame
            button.backgroundColor = .clear
            footerView.addSubview(button)
            self.tableFooterView = footerView
    }
}
