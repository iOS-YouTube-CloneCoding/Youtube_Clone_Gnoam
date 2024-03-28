//
//  SigninViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/18/24.
//

import UIKit

class SigninViewController: UIViewController {
    private var _authenticationUIView: AuthenticationUIView
    
    init(view authenticationUIView: AuthenticationUIView) {
        self._authenticationUIView = authenticationUIView
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
    
    private func setTapNextButton() {
        _authenticationUIView.nextButton.addTarget(
            self,
            action: #selector(setTapButton),
            for: .touchDown
        )
    }
    
    @objc func setTapButton() {
        let doneAuthenticationViewController = DoneAuthenticationViewController(view: _authenticationUIView)
        navigationController?.pushViewController(doneAuthenticationViewController, animated: true)
    }
}

extension SigninViewController: BaseViewController {
    func addView() {
        view.addSubview(_authenticationUIView.googleImage)
        view.addSubview(_authenticationUIView.titleLabel)
//        view.addSubview(_authenticationUIView.subTitleLabel)
        view.addSubview(_authenticationUIView.nextButton)
        view.addSubview(_authenticationUIView.nameTextField)
        view.addSubview(_authenticationUIView.emailORPhoneTextField)
        view.addSubview(_authenticationUIView.passwordTextField)
//        view.addSubview(_authenticationUIView.addAuthenticationButton)
    }
    
    private func customSubView() {
        _authenticationUIView.titleLabel.text = "회원가입"
    }
    
    func setLayout() {
        // Google ImageVIew
        NSLayoutConstraint.activate([
            _authenticationUIView.googleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 128),
            _authenticationUIView.googleImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            _authenticationUIView.googleImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -662),
            _authenticationUIView.googleImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -128)
        ])
        
        // TitleLabel
        NSLayoutConstraint.activate([
            _authenticationUIView.titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 147),
            _authenticationUIView.titleLabel.topAnchor.constraint(equalTo: _authenticationUIView.googleImage.bottomAnchor, constant: 23),
            _authenticationUIView.titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -147)
        ])
        
//        // subTitleLabel
//        NSLayoutConstraint.activate([
//            _authenticationUIView.subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44),
//            _authenticationUIView.subTitleLabel.topAnchor.constraint(equalTo: _authenticationUIView.titleLabel.bottomAnchor, constant: 14),
//            _authenticationUIView.subTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44)
//        ])
        
        // UITextField nameTextFields
        NSLayoutConstraint.activate([
            _authenticationUIView.nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            _authenticationUIView.nameTextField.topAnchor.constraint(equalTo: _authenticationUIView.titleLabel.bottomAnchor, constant: 128),
            _authenticationUIView.nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22)
        ])
        
        // UITextField emailORPhoneTextField
        NSLayoutConstraint.activate([
            _authenticationUIView.emailORPhoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            _authenticationUIView.emailORPhoneTextField.topAnchor.constraint(equalTo: _authenticationUIView.nameTextField.bottomAnchor, constant: 17),
            _authenticationUIView.emailORPhoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22)
        ])
        
        // UITextField passwordTextField
        NSLayoutConstraint.activate([
            _authenticationUIView.passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            _authenticationUIView.passwordTextField.topAnchor.constraint(equalTo: _authenticationUIView.emailORPhoneTextField.bottomAnchor, constant: 17),
//            _authenticationUIView.passwordTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -309),
            _authenticationUIView.passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22)
        ])

//        // addAuthenticationButton set
//        NSLayoutConstraint.activate([
//            _authenticationUIView.addAuthenticationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
//            _authenticationUIView.addAuthenticationButton.topAnchor.constraint(equalTo: _authenticationUIView.nextButton.topAnchor, constant: 10),
//            _authenticationUIView.addAuthenticationButton.bottomAnchor.constraint(equalTo: _authenticationUIView.nextButton.bottomAnchor, constant: -10)
//        ])
        
        // button set
        NSLayoutConstraint.activate([
            _authenticationUIView.nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            _authenticationUIView.nextButton.topAnchor.constraint(equalTo: _authenticationUIView.passwordTextField.bottomAnchor, constant: 64),
            _authenticationUIView.nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -203),
            _authenticationUIView.nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22)
        ])
    }

}
