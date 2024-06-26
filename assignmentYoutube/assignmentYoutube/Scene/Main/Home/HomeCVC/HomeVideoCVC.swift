//
//  HomeHeaderView.swift
//  assignmentYoutube
//
//  Created by Roh on 5/8/24.
//

import UIKit

final class HomeVideoCVC: UICollectionViewCell {
    private let videoContentImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "homeVideoSample1")
        return imageView
    }()
    
    
    private lazy var videoInfoContainerView: HomeVideoInfoUIView = {
        let container = HomeVideoInfoUIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var videoItemStackView: UIStackView = {
        // videoInfoContainer를 먼저 참조하여 초기화를 하는 코드
        let _ = self.videoInfoContainerView
        
        let stackView = UIStackView(arrangedSubviews: [videoContentImage, videoInfoContainerView])
        stackView.axis = .vertical
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
        videoInfoContainerView.addSubviews()
        addSubview(videoItemStackView)
    }
    
    func setLayout() {
        videoItemStackView.translatesAutoresizingMaskIntoConstraints = false
        videoInfoContainerView.setLayout()
        videoContentImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 7/10).isActive = true
        
        NSLayoutConstraint.activate([
            videoItemStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            videoItemStackView.topAnchor.constraint(equalTo: topAnchor),
            videoItemStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            videoItemStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func configure(
        videoContentImage: String,
        videoProfileImage: String,
        videoTitleLabel: String,
        videoSubTitleLabel: String
    ) {
        self.videoContentImage.image = UIImage(named: videoContentImage)
        videoInfoContainerView.configure(
            videoProfileImage: videoProfileImage,
            videoTitleLabel: videoTitleLabel,
            videoSubTitleLabel: videoSubTitleLabel
        )
    }
}

#Preview {
    HomeVideoCVC()
}
