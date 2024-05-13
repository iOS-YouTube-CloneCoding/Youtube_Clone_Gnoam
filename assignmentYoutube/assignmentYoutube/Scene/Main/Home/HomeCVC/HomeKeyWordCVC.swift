//
//  HomeKeyWordCVC.swift
//  assignmentYoutube
//
//  Created by Roh on 5/11/24.
//

import UIKit

class HomeKeyWordCVC: UICollectionViewCell {
    let keyWordButton: UIButton = {
        let button = AuthenticationButton()
        button.backgroundColor = .gray
        button.setTitleWithStyle(
            title: "다음",
            size: 14,
            weight: .medium
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nextButton: UIButton = {
        let button = AuthenticationButton()
        button.isButtonEnable(state: false)
        
        button.setTitleWithStyle(
            title: "다음",
            size: 14,
            weight: .medium
        )
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(keyWordButton)
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
//            keyWordButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
//            keyWordButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            keyWordButton.widthAnchor.constraint(equalToConstant: 48),
            keyWordButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}

#Preview {
    HomeKeyWordCVC()
}


