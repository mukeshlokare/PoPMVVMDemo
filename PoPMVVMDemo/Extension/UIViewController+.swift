//
//  UIViewController+.swift
//  plexigotv
//
//  Created by Jitesh Acharya on 16/12/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithAction(title: String?,
                             message: String?,
                             actionTitles:[String?],
                             actions:[((UIAlertAction) -> Void)?]) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
        
    }
    
    @discardableResult
    func addFocusGuide(from origin: UIView, to destination: UIView, direction: UIRectEdge, debugMode: Bool = false) -> UIFocusGuide {
        return addFocusGuide(from: origin, to: [destination], direction: direction, debugMode: debugMode)
    }
    
    @discardableResult
    func addFocusGuide(from origin: UIView, to destinations: [UIView], direction: UIRectEdge, debugMode: Bool = false) -> UIFocusGuide {
        let focusGuide = UIFocusGuide()
        view.addLayoutGuide(focusGuide)
        focusGuide.preferredFocusEnvironments = destinations
        focusGuide.widthAnchor.constraint(equalTo: origin.widthAnchor).isActive = true
        focusGuide.heightAnchor.constraint(equalTo: origin.heightAnchor).isActive = true
        
        switch direction {
        case .bottom:
            focusGuide.topAnchor.constraint(equalTo: origin.bottomAnchor).isActive = true
            focusGuide.leftAnchor.constraint(equalTo: origin.leftAnchor).isActive = true
        case .top:
            focusGuide.bottomAnchor.constraint(equalTo: origin.topAnchor).isActive = true
            focusGuide.leftAnchor.constraint(equalTo: origin.leftAnchor).isActive = true
        case .left:
            focusGuide.topAnchor.constraint(equalTo: origin.topAnchor).isActive = true
            focusGuide.rightAnchor.constraint(equalTo: origin.leftAnchor).isActive = true
        case .right:
            focusGuide.topAnchor.constraint(equalTo: origin.topAnchor).isActive = true
            focusGuide.leftAnchor.constraint(equalTo: origin.rightAnchor).isActive = true
        default:
            // Not supported :(
            break
        }
        if debugMode {
            view.addSubview(FocusGuideDebugView(focusGuide: focusGuide))
        }
        return focusGuide
    }
    
}

class FocusGuideDebugView: UIView {

    init(focusGuide: UIFocusGuide) {
        super.init(frame: focusGuide.layoutFrame)
        backgroundColor = UIColor.green.withAlphaComponent(1.0)
        layer.borderColor = UIColor.green.withAlphaComponent(0.3).cgColor
        layer.borderWidth = 1
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}

