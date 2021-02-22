//
//  Bindable.swift
//  MVVM
//
//  Created by Mihaela Glavan on 19/02/2021.
//

import Foundation

class Bindable<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?

    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
