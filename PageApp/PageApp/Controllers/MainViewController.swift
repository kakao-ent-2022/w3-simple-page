//
//  ViewController.swift
//  PageApp
//
//  Created by terry.yes on 2022/01/24.
//

import UIKit

class MainViewController: UIViewController {
    let webtoonListViewModel = WebtoonListViewModel()
    let purchaseListViewModel = PurchaseListViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webtoonListViewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WebtoonListCell", for: indexPath) as? WebtoonTableViewCell else {
            return UITableViewCell()
        }
        let webtoonViewModel = self.webtoonListViewModel.webtoonAtIndex(indexPath.row)
        cell.configure(webtoonViewModel: webtoonViewModel, purchaseListViewModel: purchaseListViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cartVC = segue.destination as? CartViewController else { return }
        cartVC.purchaseListViewModel = self.purchaseListViewModel
    }
}
