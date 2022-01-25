//
//  PurchaseViewModel.swift
//  PageApp
//
//  Created by terry.yes on 2022/01/24.
//

import Foundation

protocol PurchaseManageable {
    var purchaseCount: Int { get }
    func makePurchase(webtoon: WebtoonViewModel)
    func retrievePurchase(at index: Int) -> PurchaseViewModel?
    func remove(at Index: Int)
    func removeAll()
}

struct PurchaseViewModel {
    private let purchase: Purchase
    
    init(_ purchase: Purchase) {
        self.purchase = purchase
    }
    
    var purchaseWebtoonTitle: String {
        return self.purchase.webtoon.title
    }
    
    var purchaseTimeString: String {
        let date = self.purchase.purchaseTime
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "YYYY-MM-dd hh:mm:ss"
        return dateFormatter.string(from: date)
    }
}

class PurchaseListViewModel: PurchaseManageable {
    private var purchases = [Purchase]()
    var purchaseCount: Int {
        return purchases.count
    }
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(receivePurchase(_:)), name: .didWebtoonPurchase, object: nil)
    }
    
    func makePurchase(webtoon: WebtoonViewModel) {
        let purchase = webtoon.convertToPuchase()
        purchases.append(purchase)
    }
    
    func retrievePurchase(at index: Int) -> PurchaseViewModel? {
        return index <= purchaseCount ? PurchaseViewModel(purchases[index]) : nil
    }
    
    func remove(at index: Int) {
        if purchaseCount != 0 && index <= purchaseCount {
            purchases.remove(at: index)
        }
    }
    
    func removeAll() {
        purchases.removeAll()
    }
    
    func isPurchased(webtoon: WebtoonViewModel) -> Bool {
        for purchase in purchases {
            if purchase.webtoon.title == webtoon.title {
                return true
            }
        }
        return false
    }
    
    @objc func receivePurchase(_ notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: WebtoonViewModel?] else { return }
        guard let unwrappedWebtoonViewModel = userInfo["webtoon"],
              let webtoonViewModel = unwrappedWebtoonViewModel
        else {
            return
        }
        makePurchase(webtoon: webtoonViewModel)
    }
}
