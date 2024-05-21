//
//  DoneAuthenticationViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/18/24.
//

import UIKit

final class DoneAuthenticationViewController: BaseViewController {
    private var uiView: DoneAuthenticationUIView = DoneAuthenticationUIView()
    private let factory = ModuleFactory.resolve()
    var action: [Observable<Void>]!
    
    init(observer: [Observable<Void>]) {
        super.init(nibName: nil, bundle: nil)
        action = observer
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
            uiView.googleImage, uiView.titleLabel,
            uiView.nextButton, uiView.addAuthenticationButton
        ])
        uiView.setLayout()
    }
    
    override func setStyle() {
        setTapCheckButton()
        setTapOtherLoginButton()
    }
}

extension DoneAuthenticationViewController {
    private func setTapCheckButton() {
        uiView.nextButton.addTarget(
            self,
            action: #selector(setTapCheck),
            for: .touchDown
        )
    }
    
    private func setTapOtherLoginButton() {
        uiView.addAuthenticationButton.addTarget(
            self,
            action: #selector(setTapOtherLogin),
            for: .touchDown
        )
    }
    
    @objc func setTapCheck() {
        self.dismiss(animated: true)
        UserDefaults.setLoggedIn()
        action[0].value = ()
    }
    
    @objc func setTapOtherLogin() {
        self.dismiss(animated: true)
        if action.count < 2 {
            return
        }
        action[1].value = ()
    }
}
