//
//  HomeViewController+Extension.swift
//  assignmentYoutube
//
//  Created by Roh on 5/13/24.
//

import UIKit

enum HomeSection {
    case channel
    case keyword
    case video
}

extension HomeSection {
    var mockData: [String] {
        switch self {
        case .channel:
            let channelMockData = [
                "homeChannelSample1", "homeChannelSample2", "homeChannelSample3", "homeChannelSample4", 
                "homeChannelSample5", "homeChannelSample6", "homeChannelSample7"
            ]
            return channelMockData
            
        case .keyword:
            let keywordMockData = [
                "전체", "오늘", "동영상", "Shorts",
                "이어서 시청하기", "라이브", "게시물"
            ]
            return keywordMockData
            
        case .video:
            let videoMockData = [
                "homeVideoSample1", "homeVideoSample2", "homeVideoSample3",
                "homeVideoSample4", "homeVideoSample5", "homeVideoSample6",
            ]
            return videoMockData
            
        }
    }
}
