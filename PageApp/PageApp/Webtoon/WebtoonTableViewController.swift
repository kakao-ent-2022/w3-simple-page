//
//  WebtoonTableViewController.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/24.
//


import UIKit

class WebtoonTableViewController: UITableViewController {
    
    var dataSource: UITableViewDataSource!

    override func viewDidLoad() {
        let dataSource = WebtoonDataSource()
        tableView.dataSource = dataSource
        self.dataSource = dataSource
    }
    
}
