//
//  AppDelegate.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 28/11/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Setup IQKeyboardManager
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarTintColor = .white
        
        return true
    }
}

