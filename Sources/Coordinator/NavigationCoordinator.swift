//
//  NavigationCoordinator.swift
//  CleanArchitecture
//
//  Created by DucPD on 10/11/2021.
//

import UIKit

///
/// NavigationCoordinator is a base class for custom coordinators with a `UINavigationController` rootViewController.
///
open class NavigationCoordinator<RouteType: Route>: BaseCoordinator<RouteType, NavigationTransition> {
    public init(rootViewController: RootViewController = RootViewController(), isNavigationBarHidden: Bool = false, initialRoute: RouteType...) {
        super.init(rootViewController: rootViewController, initialRoute: initialRoute)
        rootViewController.isNavigationBarHidden = isNavigationBarHidden
    }
}
