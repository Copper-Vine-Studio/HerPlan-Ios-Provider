//
//  CommonMethods.swift
//  SampleProject
//
//  Created by Bacancy Technology on 30/12/19.
//  Copyright © 2021 Bacancy Technology. All rights reserved.
//

import Foundation
import Photos
import UIKit
import MBProgressHUD
import SpinKit

class CommonMethods
{
    class func isValidEmail(string: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: string)
    }
    
    class func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    class func isPasswordValid(_ stringPassword: String) -> Bool {
        if (stringPassword.rangeOfCharacter(from: CharacterSet.uppercaseLetters) == nil) || (stringPassword.rangeOfCharacter(from: CharacterSet.lowercaseLetters) == nil) ||
            (stringPassword.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil) ||
            stringPassword.count < 8 {
            
            return false
        }
        return true
    }
    
    class func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return .white
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func startProgressBar()
    {
        guard let view = UIApplication.topViewController()?.view else {
            return
        }
        
        let spinner:RTSpinKitView = RTSpinKitView(style: .styleArc, color: AppColors.app_theme_color)
        
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.isSquare = false
        hud.mode = MBProgressHUDMode.customView
        hud.customView = spinner
        hud.contentColor = AppColors.app_theme_color
        hud.backgroundColor = UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.4)
        hud.bezelView.color = UIColor.white
        hud.animationType = MBProgressHUDAnimation.zoomOut
        spinner.startAnimating()
    }
    
    class func stopProgressBar()
    {
        guard let view = UIApplication.topViewController()?.view else {
            return
        }
        MBProgressHUD.hide(for: view, animated: true)
    }
}
