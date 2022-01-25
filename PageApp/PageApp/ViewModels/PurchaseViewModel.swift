//
//  PurchaseViewModel.swift
//  PageApp
//
//  Created by terry.yes on 2022/01/24.
//

import Foundation

protocol Purchasable {
    func makePurchase(webtoon: WebtoonViewModel)
    func retrievePurchase(at index: Int) -> Purchase?
    func remove(at Index: Int)
    func removeAll()
}

class PurchaseListViewModel: Purchasable {
    private var purchases = [Purchase]()
    var purchaseCount: Int {
        return purchases.count
    }
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(receivePurchase(_:)), name: .didWebtoonPurchase, object: nil)
    }
    
    func makePurchase(webtoon: WebtoonViewModel) {
        let purchase = webtoon.purchased()
        purchases.append(purchase)
    }
    
    func retrievePurchase(at index: Int) -> Purchase? {
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
        makePurchase(webtoon: webtoonViewModel)
        //아직 구매기록을 테이블뷰와 연결하기 전이라 디버깅용 코드를 아래 넣었습니다.
        printAllPurchases()
    }
}
