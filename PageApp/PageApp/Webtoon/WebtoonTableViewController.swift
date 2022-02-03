//
//  WebtoonTableViewController.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/24.
//


import UIKit

class WebtoonTableViewController: UIViewController {
    
    fileprivate var dataSource: UITableViewDataSource?
    var historiesVM: HistoryListViewModel?
    var webtoonsVM: WebtoonListViewModel = WebtoonListViewModelImpl()
    let defaultStorageKey = "webtoonPurchase"

    @IBOutlet var tableView: UITableView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var bannerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerLabel.text = "카카오뱅크와 함께\n26주적금 챌린지"
        bannerLabel.numberOfLines = 2
        
        if let storedHistories = UserDefaults.standard.object(forKey: defaultStorageKey) as? [String: Date] {
            let histories = storedHistories.map { HistoryModel(name: $0.key, createdAt: $0.value) }
            historiesVM = HistoryListViewModelImpl(histories: histories)
        } else {
            historiesVM = HistoryListViewModelImpl()
        }
    
        dataSource = WebtoonDataSource.init(from: webtoonsVM)
        tableView.dataSource = dataSource
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("purchase"), object: nil, queue: nil) {(notification) in
            guard let cell = notification.object as? WebtoonCell,
                  let purchasedItem = cell.webtoonModel,
                  let indexPath = self.tableView.indexPath(for: cell) else {
                      return
                  }
            
            self.historiesVM?.append(HistoryModel(name: purchasedItem.title))
            self.tableView.reloadRows(at: [indexPath], with: .none)
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let historiesVM = historiesVM {
            webtoonsVM.updatePurchaseStatus(from: historiesVM)
            self.tableView.reloadData()
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHistory", let destination = segue.destination as? CartViewController {
            destination.historiesVM = historiesVM
        }
    }
}
