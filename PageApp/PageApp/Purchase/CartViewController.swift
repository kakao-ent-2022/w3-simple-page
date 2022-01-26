//
//  PurchaseViewController.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/25.
//

import UIKit

class CartViewController: UITableViewController {
    
    fileprivate var dataSource: HistoryListDataSource?
    var data: [HistoryModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = HistoryListDataSource(histories: data ?? [])
        tableView.dataSource = dataSource
    }
    
}
