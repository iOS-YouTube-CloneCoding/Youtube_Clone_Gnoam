//
//  VideoAPI.swift
//  assignmentYoutube
//
//  Created by Roh on 5/29/24.
//

import Foundation
import Moya

enum VideoAPI {
    case insert(VideoListRequest)                     // post
    case list(VideoListRequest)                       // get
    case delete(VideoListRequest)                     // delete
    case update(VideoListRequest)                     // put
}

extension VideoAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://www.googleapis.com/youtube/v3")!
    }
    
    var path: String {
        switch self {
        case .insert:
            return "/videos"
        case .list:
            return "/videos"
        case .delete:
            return "/videos"
        case .update:
            return "/videos"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .insert:
            return .post
        case .list:
            return .get
        case .delete:
            return .delete
        case .update:
            return .put
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .insert(_):
            return .requestPlain
        case .list(let param):
//            return .requestJSONEncodable(param)
            let params = [
                "part" : "snippet",
                "chart" : "mostPopular",
                "maxResults" : "1",
                "key" : apiKey,
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        case .delete(_):
            return .requestPlain
        case .update(_):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [
            "Content-Type": "application/json",
//            "key": apiKey
        ]
    }
    
    private var apiKey: String {
        return "AIzaSyBE6FQdXHVjMbeG9nolOsLDFGhLCXcImYM"
    }
}
