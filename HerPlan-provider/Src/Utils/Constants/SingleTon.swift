//
//  SingleTon.swift
//  SwiftByJayesh
//
//  Created by Jayesh Thummar on 26/07/18.
//  Copyright © 2018 bacancy. All rights reserved.
//

import UIKit
import Reachability
import SystemConfiguration

class SingleTon: NSObject {
    static let sharedSingleTon = SingleTon()
    
    class func isInternetAvailable() -> Bool {
 //       var status: Bool
//        let reachability =  try! Reachability()
//        switch reachability.connection
//        {
//        case .none:
//            debugPrint("Network unreachable")
//            status = false
//        case .wifi:
//            debugPrint("Network reachable through WiFi")
//            status = true
//        case .cellular:
//            status = true
//            debugPrint("Network reachable through Cellular Data")
//        case .unavailable:
//            debugPrint("Network unreachable")
//            status = false
//        }
        return true
    }
}
