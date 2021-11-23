//
//  UIViewController.swift
//  SampleProject
//
//  Created by Bacancy Technology on 30/12/19.
//  Copyright © 2021 Bacancy Technology. All rights reserved.
//

import Foundation
import UIKit

//MARK:- UIAlert View Methods -
extension UIViewController {
    
    func displayAlert(title: String?, message: String?, buttonName: String = AlertTitleMessage.ok, completion: (()->())?)
    {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionButton = UIAlertAction(title: buttonName, style: .cancel) { (action) in
            completion?()
        }
        controller.addAction(actionButton)
        DispatchQueue.main.async {
            UIApplication.topViewController()?.present(controller, animated: true, completion: nil)
        }
    }
    
    func displayAlert(title: String?, message: String?, alertActions action: [UIAlertAction])
    {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        action.forEach({ controller.addAction($0) })
        DispatchQueue.main.async {
            UIApplication.topViewController()?.present(controller, animated: true, completion: nil)
        }
    }
}
