//
//  PurchaseViewController.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/25.
//

import UIKit

class PurchaseViewController: UITableViewController {
    
    fileprivate var dataSource: PurchaseDataSource?
    var data: [PurchaseModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = PurchaseDataSource()
        dataSource?.data = data ?? []
        tableView.dataSource = dataSource
    }
    

}
