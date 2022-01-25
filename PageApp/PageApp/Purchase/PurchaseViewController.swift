//
//  PurchaseViewController.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/25.
//

import UIKit

class PurchaseViewController: UITableViewController {
    
    fileprivate var dataSource: PurchaseDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }
    

}
