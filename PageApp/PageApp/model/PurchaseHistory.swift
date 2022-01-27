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

protocol PurchaseHoldable {
    var content: [Purchase] { get }
    var count: Int { get }
    func get(at: Int) -> Purchase?
    func remove(at: Int)
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
