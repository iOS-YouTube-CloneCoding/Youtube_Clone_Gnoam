//
//  DoneAuthentication.swift
//  assignmentYoutube
//
//  Created by Roh on 3/18/24.
//

import UIKit

final class DoneAuthenticationViewController: BaseViewController {
    private var uiView: DoneAuthenticationUIView = DoneAuthenticationUIView()
    
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
            uiView.googleImage, uiView.titleLabel,
            uiView.nextButton, uiView.addAuthenticationButton
        ])
        uiView.setLayout()
    }
}

extension DoneAuthenticationViewController {
    private func setTapNextButton() {
        uiView.nextButton.addTarget(
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
        uiView.titleLabel.numberOfLines = 2
        uiView.titleLabel.text = """
        노형우님
        환영합니다!
    """
        uiView.nextButton.setTitle("확인", for: .normal)
        uiView.addAuthenticationButton.setTitle("다른 계정으로 로그인하기", for: .normal)
    }
}

