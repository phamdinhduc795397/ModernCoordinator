//
//  Router.swift
//  ModernCoordinator
//
//  Created by DucPD on 08/11/2021.
//

import Foundation

///
/// `Router` is used to abstract the transition-type that can be able to perform route from its `Coordinator`.
///

public protocol Router {
    associatedtype RouteType: Route
    func trigger(_ route: RouteType)
}
