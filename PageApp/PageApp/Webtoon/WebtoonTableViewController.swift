//
//  WebtoonTableViewController.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/24.
//


import UIKit

class WebtoonTableViewController: UIViewController {
    
    var dataSource: UITableViewDataSource!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var bannerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerLabel.text = "카카오뱅크와 함께\n26주적금 챌린지"
        bannerLabel.numberOfLines = 2 
        let dataSource = WebtoonDataSource()
        tableView.dataSource = dataSource
        self.dataSource = dataSource
    }
    
}
