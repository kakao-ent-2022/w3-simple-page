//
//  PurchaseHoldable.swift
//  PageApp
//
//  Created by nylah.j on 2022/01/27.
//

import Foundation


protocol PurchaseHoldable {
    var content: [Purchase] { get }
    var count: Int { get }
    func get(at: Int) -> Purchase?
    func remove(at: Int)
}
