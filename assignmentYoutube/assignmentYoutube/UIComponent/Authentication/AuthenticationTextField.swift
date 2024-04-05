//
//  AuthenticationTextField.swift
//  assignmentYoutube
//
//  Created by Roh on 3/18/24.
//

import UIKit

class AuthenticationTextField: UITextField {
//    private var defaultTextColor: UIColor = .black
    
    init() {
        super.init(frame: .zero)
        setDefaultStyle()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setDefaultStyle()
    }
    
    private func setDefaultStyle() {
        // UI 관련
        self.borderStyle = .roundedRect
//        self.frame.size.height = 48
//        self.frame.size.width = 331
        
        self.autocorrectionType = .no                               // 자동 수정
        self.spellCheckingType = .no                                // 맞춤법 검사
        self.autocapitalizationType = .none                         // 자동 대문자 활성화 여부
        
        self.addLeftPadding(14)
        
        self.placeholder = "내용 입력"                                // 플레이스 홀더
        self.clearButtonMode = .always                              // 입력 내용을 한번에 지우는 x버튼(오른쪽?)
        self.clearsOnBeginEditing = false                           // 편집시 기존 텍스트 필드값 제거
        self.font = .PretendardR(size: 15)                          // 레귤러 15
        
        // 키보드 관련
        self.returnKeyType = .done                                  // 키보드 엔터키 타입
        self.keyboardType = UIKeyboardType.emailAddress
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setPlaceholderWithStyle(placeholder: String, size: CGFloat, weight: FontWeight = .regualr) {
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
