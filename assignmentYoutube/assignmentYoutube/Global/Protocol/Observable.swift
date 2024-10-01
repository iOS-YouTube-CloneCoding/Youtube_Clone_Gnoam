//
//  Observable.swift
//  assignmentYoutube
//
//  Created by Roh on 4/18/24.
//

import Foundation

final class Observable<T> {
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            self.listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }
    
    func subscribe(_ closure: @escaping (T) -> Void) {
        self.listener = closure
    }
}

