//
//  AppDelegate.swift
//  PoPMVVMDemo
//
//  Created by Mukesh Lokare on 03/12/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import UIKit

typealias AnyDict = [String: Any]
typealias AnyDictString = [String: String]
typealias emptyCompletionHandler = ()->()
typealias booleanCompletion = (Bool) -> ()


@main
class AppDelegate: UIResponder, UIApplicationDelegate {


     var coordinator: MainCoordinator?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // create the main navigation controller to be used for our app
           let navController = UINavigationController()

           // send that into our coordinator so that it can display view controllers
           coordinator = MainCoordinator(navigationController: navController)

           // tell the coordinator to take over control
           coordinator?.start()

           // create a basic UIWindow and activate it
           window = UIWindow(frame: UIScreen.main.bounds)
           window?.rootViewController = navController
           window?.makeKeyAndVisible()
        
        return true
    }

}

