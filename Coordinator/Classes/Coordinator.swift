//
//  Coordinator.swift
//  Presentation
//
//  Created by DucPD on 08/11/2021.
//

import UIKit

public protocol Coordinator: Presentable {
    func addChild(_ coordinator: Coordinator)
    func removeChild(_ coordinator: Coordinator)
    func removeAllChild<T>(with type: T.Type)
    func removeAllChild()
    func removeFromParent()
    func registerParent(_ coordinator: Coordinator)
    var parent: Coordinator? { get }
}
