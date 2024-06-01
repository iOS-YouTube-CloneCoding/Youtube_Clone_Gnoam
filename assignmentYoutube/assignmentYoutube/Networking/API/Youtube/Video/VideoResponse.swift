//
//  VideoResponse.swift
//  assignmentYoutube
//
//  Created by Roh on 6/1/24.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let list = try? JSONDecoder().decode(List.self, from: jsonData)

// MARK: - List
struct VideoListResponse: Codable {
    let kind, etag: String
    let items: [Item]
    let nextPageToken: String
    let pageInfo: PageInfo
}

// MARK: - Item
struct Item: Codable {
    let kind, etag, id: String
    let snippet: Snippet
}

// MARK: - Snippet
struct Snippet: Codable {
    let publishedAt: String
    let channelID, title, description: String
    let thumbnails: Thumbnails
    let channelTitle: String
    let tags: [String]
    let categoryID: String
    let liveBroadcastContent: String
    let localized: Localized

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title, description, thumbnails, channelTitle, tags
        case categoryID = "categoryId"
        case liveBroadcastContent, localized
    }
}

// MARK: - Localized
struct Localized: Codable {
    let title, description: String
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high, standard: Default
    let maxres: Default

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high, standard, maxres
    }
}

// MARK: - Default
struct Default: Codable {
    let url: String
    let width, height: Int
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}

