//
//  UIImage+.swift
//  plexigotv
//
//  Created by Mukesh Lokare on 07/12/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
  
  class func image(withColor color: UIColor) -> UIImage? {
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1);
    UIGraphicsBeginImageContext(rect.size);
    
    guard let context = UIGraphicsGetCurrentContext() else {
      return nil
    }
    
    context.setFillColor(color.cgColor)
    context.fill(rect)
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image
  }
  
//  class func image(withCGColor cgColor: CGColor) -> UIImage? {
//    let layerGradient = CAGradientLayer()
//    layerGradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
//    layerGradient.frame = tabBar.frame
//    layerGradient.locations = [0.0, 0.05]
//    return layerGradient
//  }
  
  class func image(withView view: UIView, isOpaque: Bool = false) -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, isOpaque, 0.0)
    defer { UIGraphicsEndImageContext() }
    if let context = UIGraphicsGetCurrentContext() {
      view.layer.render(in: context)
      return UIGraphicsGetImageFromCurrentImageContext()
    }
    return nil
  }
  
  func resize(withMinimumSize newSize: CGSize, useScreenScale: Bool = true) -> UIImage {
    let widthRatio  = newSize.width  / size.width
    let heightRatio = newSize.height / size.height
    
    let ratio = max(widthRatio, heightRatio)
    let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    let scale = useScreenScale ? UIScreen.main.scale : 1.0
    
    UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
    draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
  }
  
  func resize(withMaximumSize newSize: CGSize, useScreenScale: Bool = true) -> UIImage {
    let widthRatio  = newSize.width  / size.width
    let heightRatio = newSize.height / size.height
    
    let ratio = min(widthRatio, heightRatio)
    let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    let scale = useScreenScale ? UIScreen.main.scale : 1.0
    
    UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
    draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
  }
  
    public static func imageWithRenderingModeAlwaysTemplate(named: String) -> UIImage? {
               let image = UIImage(named: named)?.withRenderingMode(.alwaysTemplate)
               let imageView = UIImageView(image: image)
               return imageView.image
    }
}

