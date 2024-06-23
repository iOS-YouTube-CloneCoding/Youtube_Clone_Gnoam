//
//  HomePlayerViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 6/18/24.
//

import Foundation
import YoutubePlayer_in_WKWebView


final class HomePlayerViewController: BaseViewController {
    private var uiView: HomePlayerUIView = HomePlayerUIView()
    let videoId: String
    let playVarsDic = ["playsinline": 1]
    
    init(videoId: String) {
        self.videoId = videoId
        print(videoId)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(videoId: String, coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = uiView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiView.playerView.load(withVideoId: videoId, playerVars: [
            "playsinline": "1"
        ])
        
        uiView.playerView.delegate = self
    }
    
    override func setLayout() {
        uiView.addSubviews([
            uiView.playerView,
        ])
        uiView.setLayout()
    }
}

extension HomePlayerViewController: WKYTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
        print("playerViewDidBecomeReady")
        playerView.playVideo()
    }
    
    func playerView(_ playerView: WKYTPlayerView, didChangeTo state: WKYTPlayerState) {
        switch state {
        case .ended:
            return
        case .unstarted:
            return
        case .playing:
            return
        case .paused:
            return
        case .buffering:
            return
        case .queued:
            return
        case .unknown:
            return
        @unknown default:
            return
        }
    }
}
