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

class PurchaseHistory {
    private var purchases: [Purchase]
    
    init() {
        purchases = []
    }
    
    func makePurchase(webtoon: Webtoon) {
        let purchase = Purchase(webtoonTitle: webtoon.title)
        self.add(purchase: purchase)
    }
    
    private func add(purchase: Purchase) {
        self.purchases.append(purchase)
    }
    
    func remove(purchase: Purchase) throws {
        for (index, _purchase) in purchases.enumerated() {
            if _purchase == purchase {
                purchases.remove(at: index)
                return
            }
        }
        throw PurchaseHistoryError.nonExist
    }
    
    func get(at: Int) -> Purchase? {
        return purchases[at]
    }
}
