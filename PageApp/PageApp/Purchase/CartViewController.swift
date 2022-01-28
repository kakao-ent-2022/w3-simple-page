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
    let defaultStorageKey = "webtoonPurchase"

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = HistoryListDataSource(historiesVM: historiesVM ?? HistoryListViewModelImpl())
        tableView.dataSource = dataSource
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        guard let historiesVM = historiesVM else {
            return
        }
        let histories: [String: Date] = historiesVM.all().reduce([String: Date]()) { (result, model) -> [String: Date] in
            let new = [model.name: model._createdAt]
            return result.merging(new, uniquingKeysWith:{ (_, new) in new })
        }
        UserDefaults.standard.set(histories, forKey: defaultStorageKey)
    }
    
}
