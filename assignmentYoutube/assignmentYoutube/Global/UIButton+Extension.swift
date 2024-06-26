//
//  UIButton+Extension.swift
//  assignmentYoutube
//
//  Created by Roh on 4/6/24.
//

import UIKit

extension UIButton {
    func isButtonEnable(state: Bool) {
        if state {
            self.backgroundColor = .systemBlue
        }
        else {
            self.backgroundColor = .gray
        }
        self.isEnabled = state
    }
    
    func isCheckBoxEnable(state: Bool) {
        if state {
            self.backgroundColor = .systemBlue
        }
        else {
            self.backgroundColor = .gray
        }
    }
    
    
}
