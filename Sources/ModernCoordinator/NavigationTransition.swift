//
//  NavigationTransition.swift
//  ModernCoordinator
//
//  Created by DucPD on 11/11/2021.
//

import UIKit
///
/// `NavigationTransition` offers transitions that can be used with a `UINavigationController` as `rootViewController`.
///

public typealias NavigationTransition = Transition<UINavigationController>
public extension Transition where RootViewController == UINavigationController {
    func push(_ presentable: Presentable, animated: Bool = true, hidesBottomBarWhenPushed: Bool = false) {
        let viewController = presentable.viewController
        guard viewController is UINavigationController == false else {
            return
        }
        viewController.hidesBottomBarWhenPushed = hidesBottomBarWhenPushed
        rootViewController.pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool = true)  {
        rootViewController.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true)  {
        rootViewController.popToRootViewController(animated: animated)
    }
    
    func setRoot(_ presentable: Presentable, animated: Bool = true) {
        let viewController = presentable.viewController
        guard viewController != rootViewController else {
            return
        }
        rootViewController.setViewControllers([viewController], animated: animated)
    }
    
    func setRoot(_ presentables: [Presentable], animated: Bool = true) {
        let viewControllers = presentables.map({ $0.viewController })
        guard !viewControllers.contains(rootViewController) else {
            return
        }
        rootViewController.setViewControllers(viewControllers, animated: animated)
    }
}
