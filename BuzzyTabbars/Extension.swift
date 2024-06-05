//
//  Extension.swift
//
//  Created by Malti Maurya on 29/05/24.
//

import Foundation

extension MutableCollection {
    mutating func mapData<T>(_ keyPath: WritableKeyPath<Element, T>, _ value: T) {
        indices.forEach { self[$0][keyPath: keyPath] = value }
    }
}
