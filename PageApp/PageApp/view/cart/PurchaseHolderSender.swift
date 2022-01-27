//
//  PurchaseHistorySender.swift
//  PageApp
//
//  Created by nylah.j on 2022/01/26.
//

import Foundation

protocol SendPurchaseHoldableDelegate: AnyObject {
    func send() -> PurchaseHoldable
}
