//
//  LoginUIView.swift
//  assignmentYoutube
//
//  Created by Roh on 3/17/24.
//

import UIKit

final class LoginUIView: UIView {
    let containerView: UIStackView = {
        let stackView = YoutubeStackView()
        return stackView
    }()
    
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
            weight: .semiBold
        )
        
        return label
    }()
    
    let subTitleLabel: UILabel = {
        var label = AuthenticationLabel()
        label.numberOfLines = 2
        
        label.setTextWithStyle(
            text: """
                Youtube로 이동하여 계속하세요\n앱 및 Safari에서도 Google 서비스에 로그인됩니다.
            """,
            size: 14,
            weight: .regualr
        )
        
        return label
    }()
    
    let nameTextField: UITextField = {
        var textField = AuthenticationTextField()
        textField.tag = 0
        textField.placeholder = "이름을 입력해주세요."
        return textField
    }()
    
    let emailORPhoneTextField: UITextField = {
        var textField = AuthenticationTextField()
        textField.tag = 1
        textField.placeholder = "이메일 또는 휴대전화"
        return textField
    }()
    
    let passwordTextField: UITextField = {
        var textField = AuthenticationTextField()
        textField.tag = 2
        textField.placeholder = "비밀번호 입력"
        return textField
    }()
    
    let nextButton: UIButton = {
        var button = AuthenticationButton()
        button.isButtonEnable(state: false)
        
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
    
    func setLayout() {
        containerView.addArrangedSubViews([
            nameTextField,
            emailORPhoneTextField,
            passwordTextField
        ])
        
        NSLayoutConstraint.activate([
            googleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 130),
            googleImage.topAnchor.constraint(equalTo: topAnchor, constant: 110),
            googleImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -662),
            googleImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -127)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 157),
            titleLabel.topAnchor.constraint(equalTo: googleImage.bottomAnchor, constant: 23),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -157)
        ])

        NSLayoutConstraint.activate([
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 44),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14),
            subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -44)
        ])
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            containerView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 68),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 204),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22)
        ])
        
        NSLayoutConstraint.activate([
            addAuthenticationButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            addAuthenticationButton.topAnchor.constraint(equalTo: nextButton.topAnchor, constant: 10),
            addAuthenticationButton.bottomAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: -10)
        ])

        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 279),
            nextButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 64),
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -203),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22)
        ])
    }
}
