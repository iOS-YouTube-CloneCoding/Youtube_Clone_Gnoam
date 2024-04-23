//
//  SignupUIView.swift
//  assignmentYoutube
//
//  Created by Roh on 4/15/24.
//

import UIKit

final class SignupUIView: UIView {
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
            text: "회원가입",
            size: 22,
            weight: .semiBold
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
        textField.isSecureEnable(state: true)
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
    
    let showPasswordLabel: UILabel = {
        var label = AuthenticationLabel()
        label.numberOfLines = 2
        
        label.setTextWithStyle(
            text: """
                비밀번호 표시
            """,
            size: 14,
            weight: .regualr
        )
        
        return label
    }()
    
    let checkBoxButton: UIButton = {
        var button = AuthenticationButton()
        button.backgroundColor = .clear
        
        if let image = UIImage(named: "checkBoxSquare") {
            button.setImage(image, for: .normal)
        }
        
        button.contentMode = .scaleAspectFit
        button.isCheckBoxEnable(state: false)
        button.makeRounded(cornerRadius: 0)
        return button
    }()
    
    var isAllFieldsFilled: Bool {
        return !nameTextField.text!.isEmpty && !emailORPhoneTextField.text!.isEmpty && !passwordTextField.text!.isEmpty
    }
    
    func setLayout() {
        containerView.addArrangedSubViews([
            nameTextField,
            emailORPhoneTextField,
            passwordTextField
        ])
        
        NSLayoutConstraint.activate([
            googleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 130),
            googleImage.topAnchor.constraint(equalTo: topAnchor, constant: 110),
//            googleImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -662),
            googleImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            googleImage.widthAnchor.constraint(equalTo: googleImage.heightAnchor, multiplier: 3.0)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 147),
            titleLabel.topAnchor.constraint(equalTo: googleImage.bottomAnchor, constant: 23),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -615),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -147)
        ])
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 128),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -309),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22)
        ])
        
        NSLayoutConstraint.activate([
            checkBoxButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            checkBoxButton.topAnchor.constraint(equalTo: showPasswordLabel.topAnchor, constant: 3),
            checkBoxButton.bottomAnchor.constraint(equalTo: showPasswordLabel.bottomAnchor, constant: -2)
        ])
        
        NSLayoutConstraint.activate([
            showPasswordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            showPasswordLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 14),
            showPasswordLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -274),
        ])
        
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            nextButton.topAnchor.constraint(equalTo: showPasswordLabel.bottomAnchor, constant: 29),
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextButton.widthAnchor.constraint(equalTo: nextButton.heightAnchor, multiplier: 7.8)
        ])
    }
}
