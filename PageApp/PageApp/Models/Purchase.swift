//
//  Purchase.swift
//  PageApp
//
//  Created by terry.yes on 2022/01/24.
//

import Foundation

struct Purchase: Codable {
    let webtoon: Webtoon
    let purchaseTime: Date
    
    init(_ webtoon: Webtoon) {
        self.webtoon = webtoon
        self.purchaseTime = Date.now
    }
}
