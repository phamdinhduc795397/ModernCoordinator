//
//  Coordinator.swift
//  Presentation
//
//  Created by DucPD on 08/11/2021.
//

import UIKit
///
/// `Coordinator` is the protocol every coordinator conforms to.
///
/// It requires an object to be able to add, remove its child and can be removed themselves from parent like `removeFromSuperview`.
///

public protocol Coordinator: Presentable {
    func addChild(_ coordinator: Coordinator)
    func removeChild(_ coordinator: Coordinator)
    func removeAllChild<T>(with type: T.Type)
    func removeAllChild()
    func removeFromParent()
    func registerParent(_ coordinator: Coordinator)
    var parent: Coordinator? { get }
}
