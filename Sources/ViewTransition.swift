//
//  ViewTransition.swift
//  ModernCoordinator
//
//  Created by DucPD on 11/11/2021.
//

import UIKit

/// `ViewTransition` offers transitions that can be used
/// with a `UIViewController` as `rootViewController`.

public typealias ViewTransition = Transition<UIViewController>

public struct Transition<RootViewController: UIViewController>: RootTransition {
    public var rootViewController: RootViewController
    public init(rootViewController: RootViewController) {
        self.rootViewController = rootViewController
    }
}

extension Transition where RootViewController: UIViewController {
    public func present(_ presentable: Presentable,
                        animated: Bool = true,
                        completion: (() -> Void)? = nil) {
        let viewController = presentable.viewController
        guard viewController != rootViewController else {
            return
        }
        rootViewController.present(viewController, animated: animated, completion: completion)
    }
    
    public func present(_ presentable: Presentable,
                        animated: Bool = true,
                        modalPresentationStyle: UIModalPresentationStyle,
                        completion: (() -> Void)? = nil) {
        let viewController = presentable.viewController
        guard viewController != rootViewController else {
            return
        }
        viewController.modalPresentationStyle = modalPresentationStyle
        present(viewController, animated: animated, completion: completion)
    }
    
    public func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        rootViewController.dismiss(animated: animated, completion: completion)
    }
}
