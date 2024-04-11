//
//  UIStackView+Extension.swift
//  assignmentYoutube
//
//  Created by Roh on 4/10/24.
//

import UIKit

extension UIStackView {
    func addArrangedSubViews(_ views: [UIView]) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
