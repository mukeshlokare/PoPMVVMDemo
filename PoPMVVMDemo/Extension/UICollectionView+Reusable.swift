//
//  UICollectionView+Reusable.swift
//  plexigo
//
//  Created by Mukesh Lokare on 16/07/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import UIKit

extension UICollectionView {
  
  func register<T: ViewReusable>(view: T.Type, bundle: Bundle? = nil) {
    let nib = UINib(nibName: T.nibName, bundle: bundle)
    register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
  }
  
  func register<T: ViewReusable>(view: T.Type, bundle: Bundle? = nil, supplementaryViewKind: String) {
    let nib = UINib(nibName: T.nibName, bundle: bundle)
    register(nib, forSupplementaryViewOfKind: supplementaryViewKind, withReuseIdentifier: T.reuseIdentifier)
  }
  
  func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: ViewReusable {
    guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
      fatalError("Unable to dequeue cell with identifier \(T.reuseIdentifier)")
    }
    return cell
  }
  
  func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind kind: String, indexPath: IndexPath) -> T where T: ViewReusable {
    guard let supplementaryView = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
      fatalError("Unable to dequeue supplementaryView with identifier \(T.reuseIdentifier)")
    }
    return supplementaryView
  }
  
}
