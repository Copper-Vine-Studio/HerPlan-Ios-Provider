//
//  UIApplication.swift
//  SampleProject
//
//  Created by Bacancy Technology on 30/12/19.
//  Copyright © 2021 Bacancy Technology. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    public class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}
