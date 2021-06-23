//
//  AppConstant.swift
//  PoPMVVMDemo
//
//  Created by Mukesh Lokare on 12/02/18.
//

import Foundation
import UIKit

struct AppConstant {
    
    static let maximumUploadImageSize = CGSize(width: 1024, height: 1024)
    static let homeFeedDefaultFetchLimit = 20
    static let maxRequestTime = 12

    let SCREEN_WIDTH = UIScreen.main.bounds.width
    
    static let appName = "app_1_ios"
    static let appStoreID = ""
        
    
    struct API {
        
        enum Environment {
            case development
            case production
            case qa
            
            var baseURL: String {
                switch self {
                case .development:
                    return ""
                case .qa:
                    return ""
                case .production:
                    return ""
                }
            }
            
            var name: String {
                switch self {
                case .development:    return "Development"
                case .qa:             return "Qa"
                case .production:     return "Production"
                }
            }
            
            var urlScheme: String {
                return "xyz://"
            }
            
            
            var bundleIdentifier: String {
                switch self {
                case .development:    return ""
                case .qa:             return ""
                case .production:     return ""
                }
            }
            
            var appstoreId: String {
                switch self {
                case .development:    return ""
                case .qa:             return ""
                case .production:     return "1423524314"
                }
            }
            
            var apiKey: String {
                switch self {
                case .development:    return "X-API-Key"
                case .qa:             return "X-API-Key"
                case .production:     return "X-API-Key"
                }
            }
            
            var apiTokenValue: String {
                switch self {
                case .development:    return ""
                case .qa:             return ""
                case .production:     return ""
                }
            }
            
            var apiXVersion: String {
                switch self {
                case .development:    return "1.1"
                case .qa:             return "1.1"
                case .production:     return "1.2"
                }
            }
            
            var version: String? {
                switch self {
                case .development:
                    let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
                    let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
                    if let shortVersion = version, let buildNumber = build{
                        return "Version: " + shortVersion + " (\(buildNumber))"
                    }
                    return ""
                case .qa:
                    let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
                    let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
                    if let shortVersion = version, let buildNumber = build{
                        return "Version: " + shortVersion + " (\(buildNumber))"
                    }
                    return ""
                case .production:
                    let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
                    let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
                    if let shortVersion = version, let buildNumber = build{
                        return "Version: " + shortVersion + " (\(buildNumber))"
                    }
                    return ""
                }
            }
            
        }
        
        
        #if Development
        static let currentEnvironment = Environment.development
        #elseif QA
        static let currentEnvironment = Environment.qa
        #else
        static let currentEnvironment = Environment.production
        #endif
        
        static let environmentName = currentEnvironment.name
        static let baseURL = currentEnvironment.baseURL
        static let urlScheme = currentEnvironment.urlScheme
        static let apiXVersion : String? = currentEnvironment.apiXVersion

        static let apiXVersion1x1 : String? = "1.1"
        static let apiXVersion1x2 : String? = "1.2"
        static let apiXVersion1x3 : String? = "1.3"

        static let apiKey = currentEnvironment.apiKey
        static let apiTokenValue : String? = currentEnvironment.apiTokenValue
        
        static let version : String? = currentEnvironment.version
       
    }
    
    struct Credential {
        #if Development
        static let authorizationKey = ""
        #elseif QA
        static let authorizationKey = ""
        #else
        static let authorizationKey = ""
        #endif
    }
}

enum UIUserInterfaceIdiom : Int {
    case unspecified
    case phone // iPhone and iPod touch style UI
    case pad   // iPad style UI (also includes macOS Catalyst)
}

enum OrientationLock {
    case white
    case faceUp
    case faceDown
    case normal
}
