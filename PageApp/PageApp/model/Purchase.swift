//
//  Purchase.swift
//  PageApp
//
//  Created by nylah.j on 2022/01/25.
//

import Foundation

struct Purchase: Equatable {
    var webtoonTitle: String
    var date: Date
    
    init(webtoonTitle: String) {
        self.webtoonTitle = webtoonTitle
        self.date = Date()
    }
}
