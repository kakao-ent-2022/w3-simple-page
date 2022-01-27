//
//  CartDataSource.swift
//  PageApp
//
//  Created by nylah.j on 2022/01/26.
//

import Foundation
import UIKit

class CartDataSource: NSObject, UITableViewDataSource {
    private let source: PurchaseHoldable
    
    init(source: PurchaseHoldable) {
        self.source = source
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(
            style: .value1,
            reuseIdentifier: CartViewController.cellIdentifier
         )
    
        var content = cell.defaultContentConfiguration()
        guard let purchase = source.get(at: indexPath.row)
        else {
            return cell
        }
        
        content.text = purchase.webtoonTitle
        content.secondaryText = formatPurchaseData(date: purchase.date)
        
        cell.contentConfiguration = content
        return cell
    }
    
    func formatPurchaseData(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
}
