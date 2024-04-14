//
//  SigninViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/18/24.
//

import UIKit

final class SignupViewController: BaseViewController {
    private var uiView: SignupUIView = SignupUIView()
    private let factory = ModuleFactory.resolve()
    
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
        
    }
}

extension SignupViewController {
    private func setTapNextButton() {
        uiView.nextButton.addTarget(
            self,
            action: #selector(setTapButton),
            for: .touchDown
        )
    }
    
    @objc func setTapButton() {
        let doneAuthenticationViewController = DoneAuthenticationViewController()
        navigationController?.pushViewController(doneAuthenticationViewController, animated: true)
    }
}
