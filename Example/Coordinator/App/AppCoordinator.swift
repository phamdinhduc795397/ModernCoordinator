//
//  AppCoordinator.swift
//  ModernCoordinator
//
//  Created by DucPD on 07/11/2021.
//

import UIKit
import ModernCoordinator

enum AppRoute: Route {
    case splash
    case tabBar
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    init(window: UIWindow) {
        let appNavigationController = UINavigationController()
        super.init(rootViewController: appNavigationController, isNavigationBarHidden: true, initialRoute: .splash)
        window.rootViewController = viewController
    }
    
    override func prepareTransition(for route: RouteType) {
        switch route {
        case .splash:
            let splashVC = SplashViewController()
            splashVC.viewModel = SplashViewModel(router: strongRouter)
            transitionPerformer.setRoot(splashVC)
        case .tabBar:
            let tabTar = TabBarController()
            tabTar.setViewControllers(createTabs(), animated: false)
            transitionPerformer.setRoot(tabTar)
        }
    }

    private func createTabs() -> [UIViewController] {
        return (0...4).map { index -> UIViewController in
            let tabBarItem = UITabBarItem(title: "Tab \(index)", image: nil, selectedImage: nil)
            let navigationController = UINavigationController()
            navigationController.tabBarItem = tabBarItem
            let homeCoordinator = HomeCoordinator(rootViewController: navigationController)
            addChild(homeCoordinator)
            return navigationController
        }
    }
}
