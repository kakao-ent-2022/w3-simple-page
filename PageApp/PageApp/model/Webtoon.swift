//
//  Novel.swift
//  PageApp
//
//  Created by nylah.j on 2022/01/25.
//

import Foundation

class Webtoon: NSObject {
    var title: String
    var author: String
    var image: String
    
    convenience init(title: String, author: String, image: String) {
        self.init(title: title, author: author, image: image, isOnSale: true)
    }
    
    required init (title: String, author: String, image: String, isOnSale: Bool) {
        self.title = title
        self.author = author
        self.image = image
    }
    
    static func == (lhs: Webtoon, rhs: Webtoon) -> Bool {
        return lhs.title == rhs.title
            && lhs.author == rhs.author
            && lhs.image == rhs.image
    }
}
