//
//  PurchaseModel.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/25.
//

import Foundation

struct PurchaseModel {
    var name: String
    var _createdAt: Date
    var createdAt: String {
        get {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return formatter.string(from: _createdAt)
        }
    }
    
    init(name: String) {
        self.name = name
        _createdAt = Date.init()
    }
}
