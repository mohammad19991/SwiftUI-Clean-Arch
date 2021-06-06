//
//  Store.swift
//  CleanArchRouting
//
//  Created by Mohammad Alatrash on 6/6/21.
//

import Combine
import SwiftUI

typealias Store<State> = CurrentValueSubject<State, Never>

extension Store {
    subscript<T>(_ keyPath: WritableKeyPath<Output, T>) -> T where T: Equatable {
        get { value[keyPath: keyPath] }
        set {
            var value = self.value
            if value[keyPath: keyPath] != newValue {
                value[keyPath: keyPath] = newValue
                self.value = value
            }
        }
    }

    func updates<Value>(for keyPath: KeyPath<Output, Value>) -> AnyPublisher<Value, Failure> where Value: Equatable {
        return map(keyPath)
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
}

extension Binding where Value: Equatable {
    func dispatched<State>(to state: Store<State>,
                           _ keyPath: WritableKeyPath<State, Value>) -> Self {
        return onSet { state[keyPath] = $0 }
    }
}

extension Binding where Value: Equatable {
    typealias ValueClosure = (Value) -> Void
    
    func onSet(_ perform: @escaping ValueClosure) -> Self {
        return .init(get: { () -> Value in
            self.wrappedValue
        }, set: { value in
            if self.wrappedValue != value {
                self.wrappedValue = value
            }
            perform(value)
        })
    }
}
