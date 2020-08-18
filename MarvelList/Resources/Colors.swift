//
//  Colors.swift
//  MarvelList
//
//  Created by Jesús Calleja Rodríguez on 13/08/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//

import Foundation
import UIKit

class Colors {
    
    var gl:CAGradientLayer!

    init() {
        let colorTop = UIColor(red: 240.0 / 255.0, green: 19.0 / 255.0, blue: 30.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0).cgColor

        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}

extension UIColor {
    public class var onboardingAppBackgroundColor: UIColor { UIColor(named : "onboardingAppBackgroundColor") ?? UIColor.white }
    public class var onboardingTextColor: UIColor { UIColor(named : "onboardingTextColor") ?? UIColor.white }
    public class var onboardingPageTintColor: UIColor { UIColor(named : "onboardingPageTintColor") ?? UIColor.white }
}

