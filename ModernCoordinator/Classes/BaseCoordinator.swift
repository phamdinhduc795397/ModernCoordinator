//
//  BaseCoordinator.swift
//  CleanArchitecture
//
//  Created by DucPD on 08/11/2021.
//

import UIKit

open class BaseCoordinator<RouteType: Route, TransitionType: TransitionProtocol>: Coordinator {
    public typealias RootViewController = TransitionType.RootViewController
    public var rootViewController: RootViewController
    public var parent: Coordinator?
    public var children: [Coordinator] = []
    
    public var transition: Transition<RootViewController> {
        return Transition(rootViewController: rootViewController)
    }
    
    public init(rootViewController: RootViewController, initialRoute: [RouteType]) {
        self.rootViewController = rootViewController
        _ = initialRoute.map(prepareTransition)
    }
    
    open func prepareTransition(for route: RouteType) {
        fatalError("Please override the \(#function) method.")
    }
    
    public func removeFromParent() {
        parent?.removeChild(self)
    }

    public func addChild(_ coordinator: Coordinator) {
        children.append(coordinator)
        coordinator.registerParent(self)
    }
    
    public func registerParent(_ coordinator: Coordinator) {
        parent = coordinator
    }

    public func removeChild(_ coordinator: Coordinator) {
        if let index = children.firstIndex(where: { $0.viewController === coordinator.viewController }) {
            children.remove(at: index)
        } else {
            print("Couldn't remove coordinator: \(coordinator). It's not a child coordinator.")
        }
    }
    
    public func removeAllChild<T>(with type: T.Type) {
        children.removeAll(where: { $0 is T })
    }

    public func removeAllChild() {
        children.removeAll()
    }
    
    public var viewController: UIViewController {
        return rootViewController
    }
            
    deinit {
        debugPrint("Deinit 📣: \(String(describing: self))")
    }
}

extension BaseCoordinator: Router {
    public typealias RouteType = RouteType
    
    public func trigger(_ route: RouteType) {
        prepareTransition(for: route)
    }
    
    public var strongRouter: StrongRouter<RouteType> {
        return StrongRouter(self)
    }
    
    public var unownedRouter: UnownedRouter<RouteType> {
        return UnownedRouter(self) { $0.strongRouter }
    }
}
