//
//  AuthenticationTextField.swift
//  assignmentYoutube
//
//  Created by Roh on 3/18/24.
//

import UIKit

class AuthenticationTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        setDefaultStyle()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setDefaultStyle()
    }
    
    private func setDefaultStyle() {
        self.borderStyle = .roundedRect
        self.autocorrectionType = .no                               
        self.spellCheckingType = .no
        self.autocapitalizationType = .none
        
        self.addLeftPadding(14)
        
        self.placeholder = "내용 입력"
        self.clearButtonMode = .always
        self.clearsOnBeginEditing = false
        self.font = .PretendardR(size: 15)
        
        self.returnKeyType = .done
        self.keyboardType = UIKeyboardType.emailAddress
        self.isSecureTextEntry = false
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setPlaceholderWithStyle(placeholder: String, size: CGFloat, weight: FontWeight = .regualr) {
        let font: UIFont?
        
        switch weight {
        case .regualr:
            font = .PretendardR(size: size.adjusted)
        case .medium:
            font = .PretendardM(size: size.adjusted)
        case .semiBold:
            font = .PretendardSB(size: size.adjusted)
        case .bold:
            font = .PretendardB(size: size.adjusted)
        }
        
        self.placeholder = placeholder
        self.font = font
    }
}
