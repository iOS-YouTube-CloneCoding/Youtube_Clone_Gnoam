//
//  HomeViewController+Extension.swift
//  assignmentYoutube
//
//  Created by Roh on 5/13/24.
//

import UIKit

enum HomeSection: Int {
    case channel = 0
    case keyword = 1
    case video = 2
    
    struct channelDataType {
        let image: String
        let title: String
    }

    struct KeywordDataType {
        let title: String
    }

    struct VideoDataType {
        let videoImage: String
        let channelImage: String
        let title: String
        let subTitle: String
    }
}

extension HomeSection {
    var getData: [Any] {
        switch self {
        case .channel:
            let data = [
                channelDataType(image: "homeChannelSample1", title: "지구닷"),
                channelDataType(image: "homeChannelSample2", title: "KBS"),
                channelDataType(image: "homeChannelSample3", title: "딩고프리"),
                channelDataType(image: "homeChannelSample4", title: "갓제인"),
                channelDataType(image: "homeChannelSample5", title: "갓홍"),
                channelDataType(image: "homeChannelSample6", title: "갓형우"),
                channelDataType(image: "homeChannelSample7", title: "때껄룩"),
            ]
            return data
        case .keyword:
            let data = [
                KeywordDataType(title: "전체"),
                KeywordDataType(title: "오늘"),
                KeywordDataType(title: "동영상"),
                KeywordDataType(title: "Shorts"),
                KeywordDataType(title: "이어서 시청하기"),
                KeywordDataType(title: "라이브"),
                KeywordDataType(title: "게시물")
            ]
            return data
        case .video:
            let data = [
                VideoDataType(videoImage: "homeVideoSample1", channelImage: "homeChannelSample6", title: "Sugarcoat", subTitle: "sehooninseoul ・조회수 23만회 ・ 3주 전  "),
                VideoDataType(videoImage: "homeVideoSample2", channelImage: "homeChannelSample6", title: "우즈의 사랑노래", subTitle: "sehooninseoul ・조회수 17만회 ・ 3주 전  "),
                VideoDataType(videoImage: "homeVideoSample3", channelImage: "homeChannelSample7", title: "Playlist 우리가 사랑하는 웨이브투어스의 노래모음 wave to earth ⋆｡⋆˚⋆｡˚", subTitle: "때껄룩TAKE A LOOK ・조회수 100만회 ・ 3주 전  "),
                VideoDataType(videoImage: "homeVideoSample4", channelImage: "homeChannelSample3", title: "태버(Tabber) - 007 & Chi-Ka (Feat.DEAN) | 딘, 태버 [DF LIVE]", subTitle: "dingo freestyle ・조회수 100만회 ・ 4주 전  "),
                VideoDataType(videoImage: "homeVideoSample5", channelImage: "homeChannelSample2", title: "새벽이 되면 생각나는 목소리, 딘 💘 유희열의 스케치북 무대 모음 💙", subTitle: "KBS부산 ・조회수 96만회 ・ 1년 전  "),
                VideoDataType(videoImage: "homeVideoSample6", channelImage: "homeChannelSample2", title: "[1시간40분] 올타임 레전드, 크러쉬의 스케치북 무대 모음!", subTitle: "KBS부산 ・조회수 8.8만회 ・ 1년 전  "),
            ]
            return data
        }
    }
}




