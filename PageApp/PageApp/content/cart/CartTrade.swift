//
//  CartManagement.swift
//  PageApp
//
//  Created by river.o on 2022/01/27.
//

import Foundation

protocol Tradable {
    func reset(carts: [Cart])
    func buy(cart: Cart)
    func getList() -> [Cart]
    func getListCount() -> Int
    func getCartByIndex(index: Int) -> Cart?
    func delete(index: Int)
}

class CartTrade: Tradable {
    private var carts : [Cart] = []
    
    func reset(carts: [Cart]) {
        self.carts = carts
    }
    
    func buy(cart: Cart) {
        carts.append(cart)
    }
    
    func getList() -> [Cart] {
        return carts
    }
    
    func getListCount() -> Int {
        return carts.count
    }
    
    func getCartByIndex(index: Int) -> Cart? {
        return carts.indices.contains(index) ? carts[index] : nil
    }
    
    func delete(index: Int) {
        carts.remove(at: index)
    }
    
}
