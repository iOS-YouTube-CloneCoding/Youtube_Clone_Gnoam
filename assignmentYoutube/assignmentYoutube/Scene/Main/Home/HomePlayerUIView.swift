//
//  HomePlayerUIView.swift
//  assignmentYoutube
//
//  Created by Roh on 6/23/24.
//

import UIKit
import YoutubePlayer_in_WKWebView

final class HomePlayerUIView: UIView {
    let googleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "googleLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
  
    let playerView: WKYTPlayerView = {
        let view = WKYTPlayerView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setLayout() {
        NSLayoutConstraint.activate([
            playerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            playerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            playerView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.56),
            playerView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}


