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
    var webtoonsVM: WebtoonListViewModel = WebtoonListViewModelImpl()

    @IBOutlet var tableView: UITableView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var bannerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerLabel.text = "카카오뱅크와 함께\n26주적금 챌린지"
        bannerLabel.numberOfLines = 2
    
        dataSource = WebtoonDataSource.init(from: webtoonsVM)
        tableView.dataSource = dataSource
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("purchase"), object: nil, queue: nil) {(notification) in
            guard let cell = notification.object as? WebtoonCell,
                  let purchasedItem = cell.webtoonModel,
                  let indexPath = self.tableView.indexPath(for: cell) else {
                      return
                  }
            
            self.historiesVM.append(HistoryModel(name: purchasedItem.title))
            self.tableView.reloadRows(at: [indexPath], with: .none)
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        webtoonsVM.updatePurchaseStatus(from: historiesVM)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHistory", let destination = segue.destination as? CartViewController {
            destination.historiesVM = historiesVM
        }
    }
}
