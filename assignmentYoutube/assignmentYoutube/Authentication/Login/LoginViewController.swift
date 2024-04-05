//
//  ViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/16/24.
//

import UIKit

class LoginViewController: UIViewController {
    private var uiView: LoginUIView = LoginUIView()
    var textFields: [UITextField]!
    
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
        setUI()
        setConfigure()
        addView()
        setLayout()
        setTapNextButton()
        setTapMakeAccountButton()
        
        
        

    }
}

extension LoginViewController: BaseViewController {
    func setConfigure() {
        textFields = [uiView.nameTextField, uiView.emailORPhoneTextField, uiView.passwordTextField]
        textFields.forEach { textField in
            textField.delegate = self
        }
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
    
    func addView() {
        uiView.addSubview(uiView.googleImage)
        uiView.addSubview(uiView.titleLabel)
        uiView.addSubview(uiView.subTitleLabel)
        uiView.addSubview(uiView.nextButton)
        uiView.addSubview(uiView.nameTextField)
        uiView.addSubview(uiView.emailORPhoneTextField)
        uiView.addSubview(uiView.passwordTextField)
        uiView.addSubview(uiView.addAuthenticationButton)
    }
    
    func setLayout() {
        uiView.setLayout()
    }
}

extension LoginViewController: TextFieldReturnDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextIndex = textField.tag + 1
        
        if nextIndex == textFields.count {
            textField.resignFirstResponder()
            return true
        }
        
        textField.resignFirstResponder()
        textFields[nextIndex].becomeFirstResponder()
        
        return true
    }
}


