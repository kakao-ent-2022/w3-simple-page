//
//  WebtoonModel.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/25.
//

import UIKit

class WebtoonModel: Decodable {
    var title: String
    var author: String
    var image: UIImage
    var isPurchased = false
    
    private enum CodingKeys: String, CodingKey {
        case title, author, imagePath = "image"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        author = try container.decode(String.self, forKey: .author)
        
        let imagePath = try container.decode(String.self, forKey: .imagePath)
        guard let image = UIImage(named: imagePath) else {
            throw CommonError.DataParsingError
        }
        self.image = image
    }
    
    init(title: String, author: String, image: UIImage) {
        self.title = title
        self.author = author
        self.image = image
    }
}
