//
//  AppDelegate.swift
//  AmiiboTableView
//
//  Created by Дмитрий Геращенко on 01.02.2021.
//  Copyright © 2021 Дмитрий Геращенко. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = AmiiboListVC()
    window?.makeKeyAndVisible()
    
    return true
  }
  
  
  
  
}

