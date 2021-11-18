//
//  Presentable.swift
//  ModernCoordinator
//
//  Created by DucPD on 08/11/2021.
//

import UIKit
///
/// Presentable is representing for the object that can be shown to the user.
///

public protocol Presentable {
    var viewController: UIViewController { get }
}

extension UIViewController: Presentable {
    public var viewController: UIViewController {
        return self
    }
}
