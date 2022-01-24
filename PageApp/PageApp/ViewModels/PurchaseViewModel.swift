//
//  PurchaseViewModel.swift
//  PageApp
//
//  Created by terry.yes on 2022/01/24.
//

import Foundation

//struct PurchaseViewModel {
//    let purchase: Purchase
//
//    init(_ webtoon: Webtoon) {
//        let currentTime = Date.now
//        self.purchase = Purchase(webtoon: webtoon, purchaseTime: currentTime)
//    }
//}

class PurchaseListViewModel {
    private var purchases = [Purchase]()
    var purchaseCount: Int {
        return purchases.count
    }
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(receivePurchase(_:)), name: .didWebtoonPurchase, object: nil)
    }
    
    func create(webtoon: WebtoonViewModel) {
        let purchase = webtoon.purchased()
        purchases.append(purchase)
    }
    
    func purchase(at index: Int) -> Purchase? {
        return index <= purchaseCount ? purchases[index] : nil
    }
    
    func remove(at index: Int) {
        if purchaseCount != 0 && index <= purchaseCount {
            purchases.remove(at: index)
        }
    }
    
    func removeAll() {
        purchases.removeAll()
    }
    
    
    
    
    func printAllPurchases() {
        print("------전체구매기록-------")
        for purchase in purchases {
            print(purchase.webtoon.title)
            print(purchase.purchaseTime)
        }
        print("-------------------")
        
    }
    
    @objc func receivePurchase(_ notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: WebtoonViewModel?] else { return }
        guard let unwrappedWebtoonViewModel = userInfo["webtoon"],
              let webtoonViewModel = unwrappedWebtoonViewModel
        else {
            return
        }
        create(webtoon: webtoonViewModel)
        //아직 구매기록을 테이블뷰와 연결하기 전이라 디버깅용 코드를 아래 넣었습니다.
        printAllPurchases()
    }
}
