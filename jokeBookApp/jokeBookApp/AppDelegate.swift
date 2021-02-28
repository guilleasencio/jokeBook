//
//  AppDelegate.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 27/2/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    let mainViewController = MainViewController()
    let navigationController = UINavigationController(rootViewController: mainViewController)
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    return true
  }
}

