//
//  UIView.swift
//  assignmentYoutube
//
//  Created by Roh on 3/17/24.
//

import UIKit

extension UIView {
    func makeRounded(cornerRadius : CGFloat?) {
        if let cornerRadius_ = cornerRadius {
            self.layer.cornerRadius = cornerRadius_
        } else {
            self.layer.cornerRadius = self.layer.frame.height / 2
        }
        
        self.layer.masksToBounds = true
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
    
}

