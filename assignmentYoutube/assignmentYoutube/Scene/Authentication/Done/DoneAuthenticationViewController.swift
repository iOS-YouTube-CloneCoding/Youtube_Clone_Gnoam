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
    var finishAction: Observable<Void>?
    
    init(observer: Observable<Void>) {
        super.init(nibName: nil, bundle: nil)
        finishAction = observer
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
        setTapNextButton()
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
        self.dismiss(animated: true)
        if let doneLogin = finishAction {
            doneLogin.value = ()
        }
    }
}
