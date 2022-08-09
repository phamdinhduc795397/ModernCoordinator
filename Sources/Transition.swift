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
