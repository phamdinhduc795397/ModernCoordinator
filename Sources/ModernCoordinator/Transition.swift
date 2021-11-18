//
//  Transition.swift
//  ModernCoordinator
//
//  Created by DucPD on 11/11/2021.
//

import UIKit

///
/// `RootTransition` is used to abstract any concrete transition implementation.
///
/// `Transition` is provided as an easily-extensible default transition type implementation.
///

public protocol RootTransition {
    associatedtype RootViewController: UIViewController
    var rootViewController: RootViewController { get set }
}

public struct Transition<RootViewController: UIViewController>: RootTransition {
    public var rootViewController: RootViewController
    public init(rootViewController: RootViewController) {
        self.rootViewController = rootViewController
    }
}

extension Transition where RootViewController: UIViewController {
    public func present(_ presentable: Presentable, animated: Bool = true,
                 modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                 completion: (() -> Void)? = nil) {
        let viewController = presentable.viewController
        guard viewController != rootViewController else {
            return
        }
        viewController.modalPresentationStyle = modalPresentationStyle
        rootViewController.present(viewController, animated: animated, completion: completion)
    }
    
    public func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        rootViewController.dismiss(animated: animated, completion: completion)
    }
}
