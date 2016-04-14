//
//  AppDelegate.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 3/21/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        UICustomizeHelper.customizeNavBar()
        
        return true
    }
}

