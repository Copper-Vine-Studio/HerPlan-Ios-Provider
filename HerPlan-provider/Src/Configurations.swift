//
//  Configuration.swift
//  HerPlan
//
//  Created by admin on 10/11/21.
//  Copyright © 2021 Bacancy. All rights reserved.
//

import Foundation


enum Environment: String {
    case dev = "Dev"
    case stage = "Stage"
    case release = "Release"
    
    var hostUrl:String {
        switch self {
            case .dev: return "Dev"
            case .stage: return "stage"
            case .release: return "release"
        }
    }
  
    var privacyPolicy:String {
        switch self {
            case .dev: return ""
            case .stage: return ""
            case .release: return ""
        }
    }
    var aboutus:String {
        switch self {
            case .dev: return ""
            case .stage: return ""
            case .release: return ""
        }
    }
    
    var contact:String {
        switch self {
            case .dev: return ""
            case .stage: return ""
            case .release: return ""
        }
    }
    
    var termsAndCondition:String {
        switch self {
            case .dev: return "Dev - URL"
            case .stage: return "Stage - URL"
            case .release: return "Release - URL"
        }
    }
    
    var googleMapAPIKey:String {
        switch self {
            case .dev, .stage: return "Dev, Stage, Key"
            case .release: return "Release Key"
        }
    }
   
    var isDevBuild: Bool {
        return self == .dev
    }
    
    var isReleaseBuild: Bool {
        return self == .release
    }
    
    var isStageBuild: Bool {
        return self == .stage
    }
    var googleClintID:String {
        switch self {
            case .dev: return ""
            case .stage: return ""
            case .release: return ""
        }
    }
}

struct Configuration {
    static var environment: Environment = {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            if configuration.range(of: "Dev") != nil {
                return Environment.dev
            } else if configuration.range(of: "Stage") != nil {
                return Environment.stage
            }
        }
        return Environment.release
    }()
}
