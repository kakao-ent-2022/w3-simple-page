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
        loadFromUserDefaults()
    }
    
    func makePurchase(webtoon: WebtoonViewModel) {
        let purchase = webtoon.convertToPuchase()
        purchases.append(purchase)
    }
    
    func retrievePurchase(at index: Int) -> PurchaseViewModel? {
        return purchases.indices.contains(index) ? PurchaseViewModel(purchases[index]) : nil
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
    
    func saveToUserDefaults() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self.purchases) {
            let defaults = UserDefaults.standard
//            print("\(purchases.count)개의 구매기록이 저장되었습니다.")
            defaults.set(encoded, forKey: "purchases")
        }
    }
    
    func loadFromUserDefaults() {
        let defaults = UserDefaults.standard
        if let savedPurchases = defaults.object(forKey: "purchases") as? Data {
            let decoder = JSONDecoder()
            if let loadedPurchases = try? decoder.decode([Purchase].self, from: savedPurchases) {
//                print("\(loadedPurchases.count)개의 구매기록이 복원되었습니다.")
                self.purchases = loadedPurchases
            }
        }
    }
}
