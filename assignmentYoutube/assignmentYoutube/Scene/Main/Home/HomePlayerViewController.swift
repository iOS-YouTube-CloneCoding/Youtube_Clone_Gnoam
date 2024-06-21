//
//  HomePlayerViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 6/18/24.
//

import Foundation
import AVKit
import AVFoundation

final class HomePlayerViewController: BaseViewController {
//    private var playerViewController: AVPlayerViewController?
    // AVPlayer 인스턴스 생성
    var videoURL: URL?
    private var player: AVPlayer?
    // AVPlayerLayer 인스턴스 생성
    private var playerLayer: AVPlayerLayer?
    
    private lazy var playerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareVideo(url: "https://www.youtube.com/embed/S-urPnZysx0")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player?.pause()
    }
    
    private func prepareVideo(url: String) {
//        let playerController = AVPlayerViewController() // 인스턴스 생성
//        if let url = URL(string: url) {
//            let player = AVPlayer(url: url as URL) // URL로 초기화된 인스턴스 생성
//            playerController.player = player // 인스턴스 할당
//            
//            //비디오 실행
//            self.present(playerController, animated: true) {
//                player.play()
//            }
//        }
//        
        
        if let url = URL(string: url) {
            player = AVPlayer(url: url)
            playerLayer = AVPlayerLayer(player: player)
            playerLayer?.frame = view.bounds
            view.layer.addSublayer(playerLayer!)
        }
        
        
        
        let playerController = AVPlayerViewController() // 인스턴스 생성
        playerController.player = player
        
//        player?.play()
        // 레이아웃 설정
                view.addSubview(playerView)
                NSLayoutConstraint.activate([
                    playerView.topAnchor.constraint(equalTo: view.topAnchor),
                    playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])

                let playButton = UIButton(type: .system)
                playButton.setTitle("Play", for: .normal)
                playButton.addTarget(self, action: #selector(playVideo), for: .touchUpInside)

                let stackView = UIStackView(arrangedSubviews: [playButton])
                stackView.axis = .vertical
                stackView.alignment = .center
                stackView.spacing = 16

                view.addSubview(stackView)
                stackView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
                ])
        //비디오 실행
                self.present(playerController, animated: true) {
                    self.player?.play()
                }

    }
    
    @objc private func playVideo() {
        
        player?.play()
    }
}
