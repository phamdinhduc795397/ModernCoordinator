//
//  Presentable.swift
//  CleanArchitecture
//
//  Created by DucPD on 08/11/2021.
//

import UIKit

public protocol Presentable {
    var viewController: UIViewController { get }
}

extension UIViewController: Presentable {
    public var viewController: UIViewController {
        return self
    }
}
