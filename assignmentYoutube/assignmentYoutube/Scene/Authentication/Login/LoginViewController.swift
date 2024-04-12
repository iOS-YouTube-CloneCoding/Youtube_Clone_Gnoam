//
//  ViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/16/24.
//

import UIKit

final class LoginViewController: BaseViewController {
    private var uiView: LoginUIView = LoginUIView()
    private var textFields: [UITextField]?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = uiView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setLayout() {
        uiView.addSubviews([
            uiView.googleImage, uiView.titleLabel, uiView.subTitleLabel,
            uiView.containerView, uiView.nextButton, uiView.addAuthenticationButton
        ])
        uiView.setLayout()
    }
    
    override func setStyle() {
        textFields = [uiView.nameTextField, uiView.emailORPhoneTextField, uiView.passwordTextField]
        textFields?.forEach { textField in
            textField.delegate = self
        }
        
        setUserLoginInfo()
        setTapNextButton()
        setTapMakeAccountButton()
    }
}

extension LoginViewController {
    private func setUserLoginInfo() {
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidChange(_:)), name: UITextField.textDidChangeNotification, object: nil)
    }
    
    private func setTapNextButton() {
        uiView.nextButton.addTarget(
            self,
            action: #selector(setTapButton),
            for: .touchUpInside
        )
    }
    
    private func setTapMakeAccountButton() {
        uiView.addAuthenticationButton.addTarget(
            self,
            action: #selector(setTapAccountButton),
            for: .touchUpInside
        )
    }
    
    @objc func setTapButton() {
        let doneAuthenticationViewController = DoneAuthenticationViewController()
        navigationController?.pushViewController(doneAuthenticationViewController, animated: true)
    }
    
    @objc func setTapAccountButton() {
        let nextViewController = SigninViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if uiView.isAllFieldsFilled {
            uiView.nextButton.isButtonEnable(state: true)
        } else {
            uiView.nextButton.isButtonEnable(state: false)
        }
    }
}

extension LoginViewController: TextFieldReturnDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextIndex = textField.tag + 1
        
        if nextIndex == textFields?.count {
            textField.resignFirstResponder()
            return true
        }
        
        textField.resignFirstResponder()
        textFields?[nextIndex].becomeFirstResponder()
        
        return true
    }
}


