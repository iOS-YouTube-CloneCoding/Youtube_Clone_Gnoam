//
//  AuthenticationButton.swift
//  assignmentYoutube
//
//  Created by Roh on 3/16/24.
//

import UIKit

class AuthenticationButton: UIButton {
    var isDisabled: Bool = false {
        didSet {
            self.isEnabled = !isDisabled
        }
    }
    
    private var defaultBackgroundColor: UIColor = .blue4285F4
    private var normalTitleColor: UIColor = .white
    
    init() {
        super.init(frame: .zero)
        setDefaultStyle()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setDefaultStyle()
    }
    
    private func setDefaultStyle() {
        self.makeRounded(cornerRadius: 6)
        self.titleLabel?.font = .PretendardB(size: 18)
        self.backgroundColor = defaultBackgroundColor
//        self.tintColor = defaultBackgroundColor
        self.setTitleColor(normalTitleColor, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setTitleWithStyle(
        title: String,
        size: CGFloat,
        titleColor: UIColor = .white,
        weight: FontWeight = .regualr
    ) {
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
        
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        self.setTitle(title, for: .normal)
    }
}

