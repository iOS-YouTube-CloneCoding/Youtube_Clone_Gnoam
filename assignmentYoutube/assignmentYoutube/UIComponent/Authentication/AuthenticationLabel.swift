//
//  AuthenticationLabel.swift
//  assignmentYoutube
//
//  Created by Roh on 3/17/24.
//

import UIKit

class AuthenticationLabel: UILabel {
    private var defaultTextColor: UIColor = .black
    
    init() {
        super.init(frame: .zero)
        setDefaultStyle()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setDefaultStyle()
    }
    
    private func setDefaultStyle() {
        self.textAlignment = .center
        self.textColor = defaultTextColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setTextWithStyle(text: String, size: CGFloat, weight: FontWeight = .regualr) {
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
        
        self.font = font
        self.text = text
    }
}
