//
//  SigninViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/18/24.
//

import UIKit

final class SignupViewController: BaseViewController {
    private var uiView: SignupUIView = SignupUIView()
    private var textFields: [UITextField]?
    private let factory = ModuleFactory.resolve()
    private var finishAction: Observable<Void> = Observable(())
    
    var tgCheckBoxState: Bool = false
    
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
            uiView.googleImage, 
            uiView.titleLabel,
            uiView.containerView, 
            uiView.nextButton,
            uiView.checkBoxButton,
            uiView.showPasswordLabel
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
        setTapCheckBoxButton()
    }
}

extension SignupViewController {
    private func finishLogin(_ observer: Observable<Void>) -> Observable<Void> {
        observer.subscribe { [self] in
            let mainViewController = factory.instantiateMainVC()
            navigationController?.pushViewController(mainViewController, animated: true)
        }
        return observer
    }
    
    private func setUserLoginInfo() {
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidChange(_:)), name: UITextField.textDidChangeNotification, object: nil)
    }
    
    private func setTapNextButton() {
        uiView.nextButton.addTarget(
            self,
            action: #selector(setTapButton),
            for: .touchDown
        )
    }
    
    private func setTapCheckBoxButton() {
        uiView.checkBoxButton.addTarget(
            self,
            action: #selector(setTapCheckButton),
            for: .touchDown
        )
    }
    
    @objc func setTapButton() {
        doneLogin()
        let viewController = self.factory.instantiateSignupCompleteVC(observer: [finishAction])
        present(viewController, animated: true, completion: nil)
    }
    
    @objc func setTapCheckButton() {
        tgCheckBoxState = !tgCheckBoxState
        uiView.passwordTextField.isSecureEnable(state: tgCheckBoxState)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if uiView.isAllFieldsFilled {
            uiView.nextButton.isButtonEnable(state: true)
        } else {
            uiView.nextButton.isButtonEnable(state: false)
        }
    }
}

extension SignupViewController: TextFieldReturnDelegate {
    private func doneLogin() {
        finishAction.subscribe { [self] in
            let mainViewController = self.factory.instantiateMainVC()
            navigationController?.pushViewController(mainViewController, animated: true)
        }
    }
    
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
