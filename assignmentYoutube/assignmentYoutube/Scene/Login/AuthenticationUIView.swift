//
//  LoginUIView.swift
//  assignmentYoutube
//
//  Created by Roh on 3/17/24.
//

import UIKit

class AuthenticationUIView: UIView {
    let googleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "googleLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        var label = AuthenticationLabel()
        label.setTextWithStyle(
            text: "로그인",
            size: 22,
            weight: .bold
        )
        return label
    }()
    
    let subTitleLabel: UILabel = {
        var label = AuthenticationLabel()
        label.numberOfLines = 2
        label.setTextWithStyle(
            text: """
                Youtube로 이동하여 계속하세요.
                앱 및 Safari에서도 Google 서비스에 로그인됩니다.
            """,
            size: 14,
            weight: .regualr
        )
        return label
    }()
    
    let nameTextField: UITextField = {
        var textField = AuthenticationTextField()
        textField.placeholder = "이름을 입력해주세요."
        return textField
    }()
    
    let emailORPhoneTextField: UITextField = {
        var textField = AuthenticationTextField()
        textField.placeholder = "이메일 또는 휴대전화"
        return textField
    }()
    
    let passwordTextField: UITextField = {
        var textField = AuthenticationTextField()
        textField.placeholder = "비밀번호 입력"
        return textField
    }()
    
    let nextButton: UIButton = {
        var button = AuthenticationButton()
        button.setTitleWithStyle(
            title: "다음",
            size: 14,
            weight: .medium
        )
        return button
    }()
    
    let addAuthenticationButton: UIButton = {
        var button = AuthenticationButton()
        button.backgroundColor = .clear
        button.setTitleWithStyle(
            title: "계정 만들기",
            size: 14,
            titleColor: .blue4285F4,
            weight: .medium
        )
        return button
    }()
    
    let checkBox: UIButton = {
        var button = AuthenticationButton()
        
        return button
    }()
}
