//
//  UITextField+Extension.swift
//  assignmentYoutube
//
//  Created by Roh on 4/5/24.
//

import UIKit

extension UITextField {
    func isSecureEnable(state: Bool) {
        self.isSecureTextEntry = state
    }
    
    func addLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func addRightPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
