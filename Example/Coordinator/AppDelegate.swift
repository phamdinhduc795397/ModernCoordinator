//
//  AppDelegate.swift
//  Coordinator
//
//  Created by Duc Pham Dinh on 11/11/2021.
//  Copyright (c) 2021 Duc Pham Dinh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupCoordinator()
        return true
    }
    
    private func setupCoordinator() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window)
        window.makeKeyAndVisible()
        self.window = window
    }
}

