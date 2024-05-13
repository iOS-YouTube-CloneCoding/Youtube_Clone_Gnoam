//
//  HomeHeaderView.swift
//  assignmentYoutube
//
//  Created by Roh on 5/8/24.
//

import UIKit

final class HomeVideoCVC: UICollectionViewCell {
    private let videoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "homeHeaderSample1")
        return imageView
    }()
    
    private let videoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.text = "hello"
        return label
    }()
    
    private lazy var videoItemStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [videoImage, videoLabel])
        stackView.axis = .vertical
        stackView.spacing = -10
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
        addSubview(videoItemStackView)
        backgroundColor = .blue
    }
    
    func setLayout() {
        videoItemStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            videoItemStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            videoItemStackView.topAnchor.constraint(equalTo: topAnchor),
            videoItemStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            videoItemStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

#Preview {
    HomeVideoCVC()
}
