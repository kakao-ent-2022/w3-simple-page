//
//  WebtoonTableViewController.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/24.
//


import UIKit

class WebtoonTableViewController: UIViewController {
    
    fileprivate var dataSource: UITableViewDataSource?
    var historiesVM: HistoryListViewModel = HistoryListViewModelImpl()

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
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("purchase"), object: nil, queue: nil) {(notification) in
            if let purchasedItem = notification.object as? WebtoonModel {
                self.historiesVM.append(HistoryModel(name: purchasedItem.title))
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHistory", let destination = segue.destination as? CartViewController {
            destination.historiesVM = historiesVM
        }
    }
}
