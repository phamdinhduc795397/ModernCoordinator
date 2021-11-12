//
//  ViewCoordinator.swift
//  CleanArchitecture
//
//  Created by DucPD on 11/11/2021.
//

import UIKit

///
/// ViewCoordinator is a base class for custom coordinators with a `UIViewController` rootViewController.
///
public class ViewCoordinator<RouteType: Route>: BaseCoordinator<RouteType, ViewTransition> {
    init(rootViewController: RootViewController, initialRoute: RouteType...) {
        super.init(rootViewController: rootViewController, initialRoute: initialRoute)
    }
}
