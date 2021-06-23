//
//  UIColor+Custom.swift
//  plexigo
//
//  Created by Mukesh Lokare on 13/07/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import UIKit

extension UIColor {
  
  class var mainBackground: UIColor {
    return UIColor(red: 252.0 / 255.0, green: 252.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
  }
  
  class var customRed: UIColor {
    return UIColor(red: 227.0 / 255.0, green: 38.0 / 255.0, blue: 38.0 / 255.0, alpha: 1.0)
  }
    
//  class var customPurple: UIColor {
//    return UIColor(red: 150.0 / 255.0, green: 1.0 / 255.0, blue: 254.0 / 255.0, alpha: 1.0)
//  }
  
  class var lightPeach: UIColor {
    return UIColor(red: 252.0 / 255.0, green: 206.0 / 255.0, blue: 199.0 / 255.0, alpha: 1.0)
  }
    
    class var transparent: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 199.0 / 255.0, alpha: 0.4)
    }
    
    class var divPinkColor: UIColor {
        return UIColor(red: 80.0 / 255.0, green: 41.0 / 255.0, blue: 112.0 / 255.0, alpha: 1.0)
    }
    
    
    class var pinkColor: UIColor {
        return UIColor(red: 213.0 / 255.0, green: 49.0 / 255.0, blue: 137.0 / 255.0, alpha: 1.0)
    }
    
    class var darkPurple: UIColor {
        return UIColor(red: 42.0 / 255.0, green: 9.0 / 255.0, blue: 65.0 / 255.0, alpha: 1.0)
    }
    
    class var lightDarkPurple: UIColor {
        return UIColor(red: 16.0 / 255.0, green: 17.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0)
    }
   
    class var unselectedButtonPurple: UIColor {
        return UIColor(red: 152.0 / 255.0, green: 113.0 / 255.0, blue: 183.0 / 255.0, alpha: 1.0)
    }
    
    class var customGreen: UIColor {
        return UIColor(red: 81.0 / 255.0, green: 16.0 / 255.0, blue: 93.0 / 255.0, alpha: 1.0)
    }
  
  class var customGold: UIColor {
    return UIColor(red: 245.0 / 255.0, green: 181.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
  }
  
  class var imageBackground: UIColor {
    return UIColor(red: 242.0 / 255.0, green: 244.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
  }
  
  class var paleGrey: UIColor {
    return UIColor(red: 242.0 / 255.0, green: 244.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
  }
  
  class var coolGrey: UIColor {
    return UIColor(red: 138.0 / 255.0, green: 144.0 / 255.0, blue: 147.0 / 255.0, alpha: 1.0)
  }
  
  class var coolGreyTwo: UIColor {
    return UIColor(red: 157.0 / 255.0, green: 165.0 / 255.0, blue: 174.0 / 255.0, alpha: 1.0)
  }
  
  class var darkGrey: UIColor {
    return UIColor(red: 29.0 / 255.0, green: 29.0 / 29.0, blue: 29.0 / 255.0, alpha: 1.0)
  }
  
  class var darkGreyishBlue: UIColor {
    return UIColor(red: 62.0 / 255.0, green: 65.0 / 255.0, blue: 68.0 / 255.0, alpha: 1.0)
  }
  
  class var customDarkGrey: UIColor {
    return UIColor(red: 35.0 / 255.0, green: 35.0 / 255.0, blue: 35.0 / 255.0, alpha: 1.0)
  }
  
  class var silver: UIColor {
    return UIColor(red: 232.0 / 255.0, green: 233.0 / 255.0, blue: 233.0 / 255.0, alpha: 1.0)
  }
  
  class var lightBlueGrey: UIColor {
    return UIColor(red: 211 / 255.0, green: 223 / 255.0, blue: 239 / 255.0, alpha: 1.0)
  }
  
  class var lightGreen: UIColor {
    return UIColor(red: 211 / 255.0, green: 255 / 255.0, blue: 166 / 255.0, alpha: 1.0)
  }
  
  class var customOrange: UIColor {
    return UIColor(red: 255 / 255.0, green: 207 / 255.0, blue: 56 / 255.0, alpha: 1.0)
  }
  
  class var coolBlue: UIColor {
    return UIColor(red: 135 / 255.0, green: 155 / 255.0, blue: 255 / 255.0, alpha: 1.0)
  }
  
  class var manilla: UIColor {
    return UIColor(red: 255 / 255.0, green: 227 / 255.0, blue: 137 / 255.0, alpha: 1.0)
  }
  
  static func rgb(_ rgb: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
    return UIColor(red: rgb / 255.0, green: rgb / 255.0, blue: rgb / 255.0, alpha: alpha)
  }
  
  class var sponsoredAdBlue: UIColor {
    return UIColor(red: 32 / 255.0, green: 168 / 255.0, blue: 216 / 255.0, alpha: 1.0)
  }
    
  class var customYellow: UIColor {
    return UIColor(red: 225.0 / 255.0, green: 174.0 / 255.0, blue: 65.0 / 255.0, alpha: 1.0)
  }
    
    class var customPink: UIColor {
           return UIColor(red: 213.0 / 255.0, green: 49.0 / 255.0, blue: 137.0 / 255.0, alpha: 1.0)
       }
    
    class var customPurple: UIColor {
        return UIColor(red: 111.0 / 255.0, green: 16.0 / 255.0, blue: 109.0 / 255.0, alpha: 1.0)
    }
    
    class var customLightPink: UIColor {
        return UIColor(red: 109/255, green: 84/255, blue: 129/255, alpha: 1.0)
    }
    
    class var customBlack: UIColor {
        return UIColor(red: 24 / 255.0, green: 23 / 255.0, blue: 24 / 255, alpha: 1.0)
    }
    
    class var darkBlue: UIColor {
        return UIColor(red: 31/255, green: 19/255, blue: 52/255, alpha: 1.0)
    }
    
    class var searchTextfieldPinkColor: UIColor {
        return UIColor(red: 215/255, green: 186/255, blue: 215/255, alpha: 1.0)
    }
    
    class var userLoginBackground: UIColor {
        return UIColor(red: 16/255, green: 17/255, blue: 48/255, alpha: 1.0)
    }
    class var gradientBlueColor: UIColor {
        return UIColor(red: 10/255, green: 11/255, blue: 35/255, alpha: 1.0)
    }
    
    class var bgGradientPurple: UIColor {
        return UIColor(red: 19/255, green: 7/255, blue: 40/255, alpha: 1.0)
    }
    
    class var sideMenuPurple: UIColor {
        return UIColor(red: 16/255, green: 17/255, blue: 48/255, alpha: 1.0)
    }
    
    var imageRepresentation : UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(self.cgColor)
        context?.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

      return image!
    }
}

