//
//  WebtoonNotificationCenter.swift
//  PageApp
//
//  Created by nylah.j on 2022/01/26.
//

import Foundation

class PurchaseNotificationCenter {
    private let notificationCenter = NotificationCenter()
    let purchaseNotification = NSNotification.Name("purchaseNotification")
    let webtoonKey = "webtoon"
    
    func addObserver(observer: Any, action: (Webtoon) -> ()) {
    
        notificationCenter.addObserver(
            observer,
            selector: #selector(didReceivePurchaseNotification),
            name: purchaseNotification,
            object: action)
    }
    
    @objc func didReceivePurchaseNotification(_ notification: Notification) {
        guard let webtoon = notification.userInfo?[webtoonKey] as? Webtoon
        else {
            return
        }
    }
    
    func post(webtoon: Webtoon) {
        notificationCenter.post(
            name: self.purchaseNotification,
            object: nil,
            userInfo: [webtoonKey : webtoon])
    }
    
    func removeObserver(observer: Any) {
        notificationCenter.removeObserver(observer)
    }
}
