//
//  StrongRouter.swift
//  ModernCoordinator
//
//  Created by DucPD on 08/11/2021.
//

import UIKit
///
/// `StrongRouter` is a type-erasure of a given Router object and, therefore, can be used as an abstraction from a specific Router
/// implementation without losing type information about its RouteType.
///
public final class StrongRouter<RouteType: Route>: Router {
    private let _trigger: (RouteType) -> Void

    public init<T: Router>(_ router: T) where T.RouteType == RouteType {
        _trigger = router.trigger
    }
    
    public func trigger(_ route: RouteType) {
        _trigger(route)
    }
}
