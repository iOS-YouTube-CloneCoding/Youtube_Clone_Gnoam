//
//  VideoRequest.swift
//  assignmentYoutube
//
//  Created by Roh on 6/1/24.
//

import Foundation

struct VideoListRequest: Codable {
    // MARK: - 필수 파라미터
    var part: String
    
    // MARK: - 필터
    let chart: String
//    let id: String?
//    let myRating: String?
    
//    // MARK: - 선택적 파라미터
//    let h1: String?
//    let maxHeight: Int?
    let maxResults: Int
//    let maxWidth: Int?
//    let onBehalfOfContentOwner: String?
//    let pageToken: String?
//    let regionCode: String?
//    let videoCategoryId: String?
    
    init(part: String, chart: String, maxResults: Int) {
        self.part = part
        self.chart = chart
        self.maxResults = maxResults
    }
}
