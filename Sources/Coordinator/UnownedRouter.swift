//
//  UnownedRouter.swift
//  CleanArchitecture
//
//  Created by DucPD on 11/11/2021.
//

import Foundation

public typealias UnownedRouter<RouteType: Route> = UnownedErased<StrongRouter<RouteType>>

@propertyWrapper
public struct UnownedErased<Value> {
    private var _value: () -> Value
    public var wrappedValue: Value {
        return _value()
    }
}

extension UnownedErased {
    public init<Erasable: AnyObject>(_ value: Erasable, erase: @escaping (Erasable) -> Value) {
        self._value = UnownedErased.createValueClosure(for: value, erase: erase)
    }
    
    private static func createValueClosure<Erasable: AnyObject>(
        for value: Erasable,
        erase: @escaping (Erasable) -> Value) -> () -> Value {
        return { [unowned value] in erase(value) }
    }
}

extension UnownedErased: Router where Value: Router {
    public typealias RouteType = Value.RouteType
    
    public func trigger(_ route: RouteType) {
        wrappedValue.trigger(route)
    }
}
