//
//  HPCornerRadius.swift
//  HerPlan
//
//  Created by Kuldipsinh Chavda on 11/11/21.
//  Copyright © 2021 Bacancy. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
  @IBInspectable var cornerRadius : CGFloat {
        get {
            return self.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
}
