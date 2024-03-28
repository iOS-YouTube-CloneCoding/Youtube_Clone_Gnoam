//
//  DoneAuthentication.swift
//  assignmentYoutube
//
//  Created by Roh on 3/18/24.
//

import UIKit

class DoneAuthenticationViewController: UIViewController {
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
        setTapNextButton()
    }
    
}

extension DoneAuthenticationViewController: BaseViewController {
    private func setTapNextButton() {
        _authenticationUIView.nextButton.addTarget(
            self,
            action: #selector(setTapButton),
            for: .touchDown
        )
    }
    
    @objc func setTapButton() {
        let nextViewController = MainViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private func customSubView() {
        _authenticationUIView.titleLabel.numberOfLines = 2
        _authenticationUIView.titleLabel.text = """
            노형우님
            환영합니다!
        """
        _authenticationUIView.nextButton.setTitle("확인", for: .normal)
        _authenticationUIView.addAuthenticationButton.setTitle("다른 계정으로 로그인하기", for: .normal)
    }
    
    func addView() {
        view.addSubview(_authenticationUIView.googleImage)
        view.addSubview(_authenticationUIView.titleLabel)
        view.addSubview(_authenticationUIView.nextButton)
        view.addSubview(_authenticationUIView.addAuthenticationButton)
    }
    
    func setLayout() {
        // Google ImageView
        NSLayoutConstraint.activate([
            _authenticationUIView.googleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 128),
            _authenticationUIView.googleImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 248),
            _authenticationUIView.googleImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -524),
            _authenticationUIView.googleImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -128)
        ])
        
        // TitleLabel
        NSLayoutConstraint.activate([
            _authenticationUIView.titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 123),
            _authenticationUIView.titleLabel.topAnchor.constraint(equalTo: _authenticationUIView.googleImage.bottomAnchor, constant: 23),
            _authenticationUIView.titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -123)
        ])
        
        // button set
        NSLayoutConstraint.activate([
            _authenticationUIView.nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            _authenticationUIView.nextButton.topAnchor.constraint(equalTo: _authenticationUIView.titleLabel.bottomAnchor, constant: 53),
            _authenticationUIView.nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22)
        ])
        
        // addAuthenticationButton set
        NSLayoutConstraint.activate([
            _authenticationUIView.addAuthenticationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 112),
            _authenticationUIView.addAuthenticationButton.topAnchor.constraint(equalTo: _authenticationUIView.nextButton.bottomAnchor, constant: 23),
            _authenticationUIView.addAuthenticationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -283),
            _authenticationUIView.addAuthenticationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -112)
        ])
    }
}
