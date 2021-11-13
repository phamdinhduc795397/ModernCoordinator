//
//  Router.swift
//  ModernCoordinator
//
//  Created by DucPD on 08/11/2021.
//

import Foundation

public protocol Router {
    associatedtype RouteType: Route
    func trigger(_ route: RouteType)
}
