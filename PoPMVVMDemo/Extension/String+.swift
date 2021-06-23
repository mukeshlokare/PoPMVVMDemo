//
//  String+.swift
//  plexigotv
//
//  Created by Jitesh Acharya on 16/12/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    public func checkTextCount()->Bool {
        return self.removeWhiteSpacesFromTheString().count == 0 ? false : true
    }
    
    func removeWhiteSpacesFromTheString() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
    public func validateEmailAddress()->Bool {
        if self.checkTextCount() {
            return self.isValidEmail()
        }
        return false
    }
    
    private func isValidEmail( ) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self)
        return result
    }
}
