//
//  CollectionView.swift
//  assignmentYoutube
//
//  Created by Roh on 5/7/24.
//

import UIKit

final class HomeChannelCVC: UICollectionViewCell {
    private let channelImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "homeChannelSample1")
        return imageView
    }()
    
    private let channelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.text = "hello"
        return label
    }()
    
    private lazy var subTitleItemStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [channelImage, channelLabel])
        stackView.axis = .vertical
        stackView.spacing = -10
        stackView.alignment = .center
        stackView.distribution = .fill
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
            subTitleItemStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subTitleItemStackView.topAnchor.constraint(equalTo: topAnchor),
            subTitleItemStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            subTitleItemStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

#Preview {
    HomeChannelCVC()
}
