//
//  WebtoonModel.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/25.
//


class WebtoonModel: Codable {
    var title: String
    var author: String
    var imagePath: String
    var isPurchased = false
    
    private enum CodingKeys: String, CodingKey {
        case title, author, imagePath = "image"
    }
}
