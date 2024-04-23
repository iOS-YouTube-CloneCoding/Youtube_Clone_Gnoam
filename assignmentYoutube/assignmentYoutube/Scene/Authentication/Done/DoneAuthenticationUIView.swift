//
//  LoginDoneUIView.swift
//  assignmentYoutube
//
//  Created by Roh on 4/12/24.
//

import UIKit

final class DoneAuthenticationUIView: UIView {
    let googleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "googleLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        var label = AuthenticationLabel()
        label.numberOfLines = 2
        label.setTextWithStyle(
            text: "OOO님\n환영합니다!",
            size: 26,
            weight: .semiBold
        )
        
        return label
    }()
        
    let nextButton: UIButton = {
        var button = AuthenticationButton()
        button.isButtonEnable(state: true)
        
        button.setTitleWithStyle(
            title: "확인",
            size: 14,
            weight: .medium
        )
        
        return button
    }()
    
    let addAuthenticationButton: UIButton = {
        var button = AuthenticationButton()
        button.backgroundColor = .clear
        
        button.setTitleWithStyle(
            title: "다른 계정으로 로그인하기",
            size: 14,
            titleColor: .blue4285F4,
            weight: .medium
        )
        
        return button
    }()
    
    func setLayout() {
        NSLayoutConstraint.activate([
            googleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 128),
            googleImage.topAnchor.constraint(equalTo: topAnchor, constant: 248),
            googleImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            googleImage.widthAnchor.constraint(equalTo: googleImage.heightAnchor, multiplier: 3.0)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 123),
            titleLabel.topAnchor.constraint(equalTo: googleImage.bottomAnchor, constant: 23),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -123)
        ])

        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            nextButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 53),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22)
        ])
        
        NSLayoutConstraint.activate([
            addAuthenticationButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 112),
            addAuthenticationButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 23),
            addAuthenticationButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -283),
            addAuthenticationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -112)
        ])
    }
}


