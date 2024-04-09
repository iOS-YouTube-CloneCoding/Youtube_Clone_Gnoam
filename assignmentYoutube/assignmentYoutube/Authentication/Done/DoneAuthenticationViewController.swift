//
//  DoneAuthentication.swift
//  assignmentYoutube
//
//  Created by Roh on 3/18/24.
//

import UIKit

final class DoneAuthenticationViewController: UIViewController {
    private var authenticationUIView: LoginUIView = LoginUIView()
    
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
        setTapNextButton()
    }
}

extension DoneAuthenticationViewController: BaseViewController {
    private func setTapNextButton() {
        authenticationUIView.nextButton.addTarget(
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
        authenticationUIView.titleLabel.numberOfLines = 2
        authenticationUIView.titleLabel.text = """
            노형우님
            환영합니다!
        """
        authenticationUIView.nextButton.setTitle("확인", for: .normal)
        authenticationUIView.addAuthenticationButton.setTitle("다른 계정으로 로그인하기", for: .normal)
    }
    
    func addView() {
        view.addSubview(authenticationUIView.googleImage)
        view.addSubview(authenticationUIView.titleLabel)
        view.addSubview(authenticationUIView.nextButton)
        view.addSubview(authenticationUIView.addAuthenticationButton)
    }
    
    func setLayout() {
        // Google ImageView
        NSLayoutConstraint.activate([
            authenticationUIView.googleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 128),
            authenticationUIView.googleImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 248),
            authenticationUIView.googleImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -524),
            authenticationUIView.googleImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -128)
        ])
        
        // TitleLabel
        NSLayoutConstraint.activate([
            authenticationUIView.titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 123),
            authenticationUIView.titleLabel.topAnchor.constraint(equalTo: authenticationUIView.googleImage.bottomAnchor, constant: 23),
            authenticationUIView.titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -123)
        ])
        
        // button set
        NSLayoutConstraint.activate([
            authenticationUIView.nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            authenticationUIView.nextButton.topAnchor.constraint(equalTo: authenticationUIView.titleLabel.bottomAnchor, constant: 53),
            authenticationUIView.nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22)
        ])
        
        // addAuthenticationButton set
        NSLayoutConstraint.activate([
            authenticationUIView.addAuthenticationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 112),
            authenticationUIView.addAuthenticationButton.topAnchor.constraint(equalTo: authenticationUIView.nextButton.bottomAnchor, constant: 23),
            authenticationUIView.addAuthenticationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -283),
            authenticationUIView.addAuthenticationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -112)
        ])
    }
}
