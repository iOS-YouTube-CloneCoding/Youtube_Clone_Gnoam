//
//  HomeKeyWordCVC.swift
//  assignmentYoutube
//
//  Created by Roh on 5/11/24.
//

import UIKit

class HomeKeyWordCVC: UICollectionViewCell {
    private let subTitleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "homeHeaderSample2")
        return imageView
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.text = "bye"
        return label
    }()
    
    private lazy var subTitleItemStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [subTitleImage, subTitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
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
        addSubview(subTitleItemStackView)
    }
    
    func setLayout() {
        subTitleItemStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            subTitleItemStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            subTitleItemStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
//            subTitleItemStackView.widthAnchor.constraint(equalToConstant: frame.width / 5),
//            subTitleItemStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
