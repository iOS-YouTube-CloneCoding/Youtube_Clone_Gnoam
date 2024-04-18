//
//  NSLayoutConstraint+Extension.swift
//  assignmentYoutube
//
//  Created by Roh on 4/7/24.
//

import UIKit

extension NSLayoutConstraint {
    func with(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
}
