//
//  CartViewController.swift
//  PageApp
//
//  Created by terry.yes on 2022/01/25.
//

import UIKit

class CartViewController: UITableViewController {
    var purchaseListViewModel: Purchasable?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchaseListViewModel?.purchaseCount ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "purchaseHistoryCell", for: indexPath)
        guard let purchase = purchaseListViewModel?.retrievePurchase(at: indexPath.row) else {
            return UITableViewCell()
        }
        cell.textLabel?.text = purchase.purchaseWebtoonTitle
        cell.detailTextLabel?.text = purchase.purchaseTimeString
        return cell
    }

    @IBAction func clearButtonTouched(_ sender: Any) {
        purchaseListViewModel?.removeAll()
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            purchaseListViewModel?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
