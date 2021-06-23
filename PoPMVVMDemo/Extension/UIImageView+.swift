//
//  UIImageView+.swift
//  plexigotv
//
//  Created by abc on 25/01/21.
//  Copyright © 2021 neosoft. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    
    // For insert layer in background
       func addBlackGradientLayerInBackground(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        gradient.startPoint = CGPoint(x: 0.0, y: 0.8)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.layer.addSublayer(gradient)
       }
}
