//
//  HomeKeyWordCVC.swift
//  assignmentYoutube
//
//  Created by Roh on 5/11/24.
//

import UIKit

class HomeKeyWordCVC: UICollectionViewCell {
    private let keyWordButton: UIButton = {
        let button = AuthenticationButton()
        button.backgroundColor = .gray
        button.setTitleWithStyle(
            title: "안녕하세요 저는 노형우입니당",
            size: 14,
            weight: .medium
        )
        var config = UIButton.Configuration.plain()
        config.titlePadding = 11
        button.configuration = config
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
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
            keyWordButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 9),
            keyWordButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            keyWordButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            keyWordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4.5),
        ])
    }
    
    func configure(title: String) {
        keyWordButton.setTitle(title, for: .normal)
    }
    
    func getButtonSize() {
        
    }
}

#Preview {
    HomeKeyWordCVC()
}


