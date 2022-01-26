//
//  WebtoonModel.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/25.
//

import UIKit

struct WebtoonModel {
    var title: String!
    var author: String!
    var image: UIImage!
    
    init(title: String, author: String, imagePath: String) {
        self.title = title
        self.author = author
        self.image = UIImage.init(named: imagePath, in: nil, compatibleWith: nil)
    }
}
