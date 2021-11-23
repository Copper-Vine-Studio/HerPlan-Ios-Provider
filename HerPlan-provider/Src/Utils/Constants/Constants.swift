//
//  Constants.swift
//  SampleProject
//
//  Created by Bacancy Technology on 30/12/19.
//  Copyright © 2021 Bacancy Technology. All rights reserved.
//

import UIKit

// MARK:- API URL

struct APIURL
{
    //Base URL
    static let BASEURL : String = Configuration.environment.hostUrl
  
 
}

// MARK:- Fonts
extension UIFont {
    static var system16_Medium: UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .medium)
    }
    static var system14_Medium: UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    static var system14_Regular: UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    static var system16_Regular: UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .regular)
    }
}
// MARK:- Colors
enum AppColors {
    static var app_theme_color: UIColor { return #colorLiteral(red: 0.1725490196, green: 0.6470588235, blue: 0.1725490196, alpha: 1) }
    static var app_black: UIColor { return #colorLiteral(red: 0.1647058824, green: 0.1647058824, blue: 0.1647058824, alpha: 1) }
    static var app_light_gray: UIColor { return #colorLiteral(red: 0.6039215686, green: 0.6039215686, blue: 0.6039215686, alpha: 1) }
    static var app_light_gray20: UIColor { return #colorLiteral(red: 0.7992340686, green: 0.7992340686, blue: 0.7992340686, alpha: 1) }
    static var app_blue: UIColor { return #colorLiteral(red: 0.1921568627, green: 0.4352941176, blue: 0.6392156863, alpha: 1) }
    static var app_white: UIColor { return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) }
    static var app_red: UIColor { return #colorLiteral(red: 0.7098039216, green: 0.08235294118, blue: 0.08235294118, alpha: 1) }
    static var app_clear:UIColor { return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) }
}


// MARK:- Messages
enum MessageConst {
    static let emptyEmail = "Please enter Email Address"
}

enum AlertTitleMessage {
    static let INTERNET_ERROR = "You are browsing offline. Please check your internet connection!"
    static let ERROR = "Opps! Something went wrong."
   static let success = "Success"
   static let ok = "OK"
   static let gotIt = "Got It !"
   static let dismiss = "Dismiss"
   static let yes = "Yes"
   static let no = "No"
   static let cancel = "Cancel"
   static let save = "Save"
    static let logout = "Are you sure you want to Logout?"
}

// MARK:- StoryBoard Ids
enum StoryboardId {
    static let HPLoginViewController = "HPLoginViewController"
    static let HPSignUpViewController = "HPSignUpViewController"
    static let HPCreatePasswordViewController = "HPCreatePasswordViewController"
    
}

// MARK:- CellIds
enum CellID {
    static let profileTableViewCell = "ProfileTableViewCell"
    
}

// MARK:- Navigation Ids
enum NavigationControllerId {
    static let accountNavigationController = "AccountNavigationController"
    
}

// MARK:- Storyboard Ids
enum Storyboard: String {
    case main = "Main"

    var storyboard: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}

// MARK:- Call Notification
enum NotificationConst: String {
    case downloadMediaProgress = "downloadMediaProgress"
    
    func postNotification(notificationObject object: Any? = nil, userInfo aUserInfo: [AnyHashable : Any]? = nil) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: self.rawValue), object: object, userInfo: aUserInfo)
    }
    
    var nsName : NSNotification.Name {
        return NSNotification.Name(rawValue: self.rawValue)
    }
}


