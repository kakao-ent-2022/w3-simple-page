//
//  PurchaseViewController.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/25.
//

import UIKit

class CartViewController: UITableViewController {
    
    fileprivate var dataSource: HistoryListDataSource?
    var historiesVM: HistoryListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = HistoryListDataSource(historiesVM: historiesVM ?? HistoryListViewModelImpl())
        tableView.dataSource = dataSource
    }
    
}
