//
//  TabBarController.swift
//  Presentation
//
//  Created by DucPD on 04/11/2021.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.barTintColor = .white
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.isTranslucent = false
    }
}
