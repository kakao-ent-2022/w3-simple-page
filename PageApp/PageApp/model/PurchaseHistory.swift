//
//  PurchaseHistory.swift
//  PageApp
//
//  Created by nylah.j on 2022/01/25.
//

import Foundation

enum PurchaseHistoryError: Error {
    case nonExist
}

class PurchaseHistory: PurchaseHoldable {
    var content: [Purchase]
    
    var count: Int {
        return content.count
    }
    
    init() {
        content = []
    }
    
    func makePurchase(webtoon: Webtoon) {
        let purchase = Purchase(webtoonTitle: webtoon.title)
        self.add(purchase: purchase)
    }
    
    private func add(purchase: Purchase) {
        content.append(purchase)
    }
    
    func remove(at: Int) {
        content.remove(at: at)
    }
    
    func get(at: Int) -> Purchase? {
        return content[at]
    }
}
