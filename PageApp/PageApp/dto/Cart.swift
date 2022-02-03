//
//  Cart.swift
//  PageApp
//
//  Created by river.o on 2022/01/26.
//

import Foundation

struct Cart {
    var title: String
    var purchaseDate: String

    init(title: String) {
        self.title = title
        
        let formatter = DateFormatter()
        formatter.dateFormat =  "yyyy-MM-dd HH:mm:ss"
        self.purchaseDate = formatter.string(from: Date())
    }
}
