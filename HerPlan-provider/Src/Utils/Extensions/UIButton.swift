//
//  UIButton.swift
//  SampleProject
//
//  Created by Bacancy Technology on 30/12/19.
//  Copyright © 2021 Bacancy Technology. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func setGradientButton() {
        self.layer.cornerRadius = 25.0
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: self.frame.size)
        gradient.colors = [UIColor(displayP3Red: 194.0/255.0, green: 151.0/255.0, blue: 84.0/255.0, alpha: 1.0).cgColor, UIColor(displayP3Red: 244.0/255.0, green: 230.0/255.0, blue: 153.0/255.0, alpha: 1.0).cgColor]
        let shape = CAShapeLayer()
        shape.lineWidth = 1.0
        shape.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        self.layer.addSublayer(gradient)
    }
    
    func makeRoundedButton() {
        self.layer.cornerRadius = 25.0
    }
}
