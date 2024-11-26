//
//  GameItemDataModel.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

struct GameItemDataModel: Codable {
    let id: Int?
    let slug: String?
    let url: String?
    let title: String?
    var content: String?
    var image: String?
    var thumbnail: String?
    var status: String?
    var category: String?
    var publishedAt: String?
    var updatedAt: String?
    var userId: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, slug,url, title, content, image, thumbnail, status, category, publishedAt, updatedAt, userId
    }
    
}
