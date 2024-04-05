//
//  SigninViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/18/24.
//

import UIKit

class SigninViewController: UIViewController {
    private var authenticationUIView: AuthenticationUIView = AuthenticationUIView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        addView()
        customSubView()
        setLayout()
    }
}

extension SigninViewController: BaseViewController {
    private func setTapNextButton() {
        authenticationUIView.nextButton.addTarget(
            self,
            action: #selector(setTapButton),
            for: .touchDown
        )
    }
    
    @objc func setTapButton() {
        let doneAuthenticationViewController = DoneAuthenticationViewController()
        navigationController?.pushViewController(doneAuthenticationViewController, animated: true)
    }
    
    func addView() {
        view.addSubview(authenticationUIView.googleImage)
        view.addSubview(authenticationUIView.titleLabel)
//        view.addSubview(_authenticationUIView.subTitleLabel)
        view.addSubview(authenticationUIView.nextButton)
        view.addSubview(authenticationUIView.nameTextField)
        view.addSubview(authenticationUIView.emailORPhoneTextField)
        view.addSubview(authenticationUIView.passwordTextField)
//        view.addSubview(_authenticationUIView.addAuthenticationButton)
    }
    
    private func customSubView() {
        authenticationUIView.titleLabel.text = "회원가입"
    }
    
    func setLayout() {
        // Google ImageVIew
        NSLayoutConstraint.activate([
            authenticationUIView.googleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 128),
            authenticationUIView.googleImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            authenticationUIView.googleImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -662),
            authenticationUIView.googleImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -128)
        ])
        
        // TitleLabel
        NSLayoutConstraint.activate([
            authenticationUIView.titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 147),
            authenticationUIView.titleLabel.topAnchor.constraint(equalTo: authenticationUIView.googleImage.bottomAnchor, constant: 23),
            authenticationUIView.titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -147)
        ])
        
//        // subTitleLabel
//        NSLayoutConstraint.activate([
//            _authenticationUIView.subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44),
//            _authenticationUIView.subTitleLabel.topAnchor.constraint(equalTo: _authenticationUIView.titleLabel.bottomAnchor, constant: 14),
//            _authenticationUIView.subTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44)
//        ])
        
        // UITextField nameTextFields
        NSLayoutConstraint.activate([
            authenticationUIView.nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            authenticationUIView.nameTextField.topAnchor.constraint(equalTo: authenticationUIView.titleLabel.bottomAnchor, constant: 128),
            authenticationUIView.nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22)
        ])
        
        // UITextField emailORPhoneTextField
        NSLayoutConstraint.activate([
            authenticationUIView.emailORPhoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            authenticationUIView.emailORPhoneTextField.topAnchor.constraint(equalTo: authenticationUIView.nameTextField.bottomAnchor, constant: 17),
            authenticationUIView.emailORPhoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22)
        ])
        
        // UITextField passwordTextField
        NSLayoutConstraint.activate([
            authenticationUIView.passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            authenticationUIView.passwordTextField.topAnchor.constraint(equalTo: authenticationUIView.emailORPhoneTextField.bottomAnchor, constant: 17),
//            _authenticationUIView.passwordTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -309),
            authenticationUIView.passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22)
        ])

//        // addAuthenticationButton set
//        NSLayoutConstraint.activate([
//            _authenticationUIView.addAuthenticationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
//            _authenticationUIView.addAuthenticationButton.topAnchor.constraint(equalTo: _authenticationUIView.nextButton.topAnchor, constant: 10),
//            _authenticationUIView.addAuthenticationButton.bottomAnchor.constraint(equalTo: _authenticationUIView.nextButton.bottomAnchor, constant: -10)
//        ])
        
        // button set
        NSLayoutConstraint.activate([
            authenticationUIView.nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            authenticationUIView.nextButton.topAnchor.constraint(equalTo: authenticationUIView.passwordTextField.bottomAnchor, constant: 64),
            authenticationUIView.nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -203),
            authenticationUIView.nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22)
        ])
    }

}
