//
//  HomeVideoInfoUIView.swift
//  assignmentYoutube
//
//  Created by Roh on 5/16/24.
//

import UIKit

final class HomeVideoInfoUIView: UIView {
    private let videoProfileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "homeChannelSample1")
        return imageView
    }()
    
    private let videoTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Playlist 우리가 사랑하는 웨이브투어스의 \n노래모음 wave to earth ⋆｡⋆˚⋆｡˚"
        return label
    }()
    
    private let videoSubTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.textColor = .gray606060
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "때껄룩TAKE A LOOK ・조회수 100만회 ・ 3주 전  "
        return label
    }()
    
    private let videoMenuButton: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: "videoMenuButton") {
            button.setImage(image, for: .normal)
        }
        
        return button
    }()
    
    func addSubviews() {
        addSubviews([
            videoProfileImage,
            videoTitleLabel,
            videoSubTitleLabel,
            videoMenuButton
        ])
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            videoProfileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            videoProfileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            videoProfileImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
            videoProfileImage.heightAnchor.constraint(equalTo: videoProfileImage.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            videoTitleLabel.leadingAnchor.constraint(equalTo: videoProfileImage.trailingAnchor, constant: 12),
            videoTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.72),
            videoTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
        ])

        NSLayoutConstraint.activate([
            videoSubTitleLabel.leadingAnchor.constraint(equalTo: videoTitleLabel.leadingAnchor),
            videoSubTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.72),
            videoSubTitleLabel.topAnchor.constraint(equalTo: videoTitleLabel.bottomAnchor, constant: 4),
        ])
        
        NSLayoutConstraint.activate([
            videoMenuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            videoMenuButton.topAnchor.constraint(equalTo: videoTitleLabel.topAnchor, constant: -5),
        ])
    }
    
    func configure(
        videoProfileImage: String,
        videoTitleLabel: String,
        videoSubTitleLabel: String
    ) {
        self.videoProfileImage.image = UIImage(named: videoProfileImage)
        self.videoTitleLabel.text = videoTitleLabel
        self.videoSubTitleLabel.text = videoSubTitleLabel
    }
}


