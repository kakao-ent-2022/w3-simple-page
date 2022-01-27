//
//  CartViewController.swift
//  PageApp
//
//  Created by nylah.j on 2022/01/25.
//

import UIKit

class CartViewController: UITableViewController {
    static let identifier = "CartViewController"
    static let cellIdentifier = "CartCell"
    
    var cartProduct: PurchaseHoldable?
    var cartDataSource: CartDataSource!
    weak var delegate: SendPurchaseHoldableDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        cartProduct = delegate?.send()
        
        initCartDataSource()
        initCartTable()
    }
    
    func initCartDataSource() {
        guard let cartProduct = cartProduct else {
            return
        }
        
        cartDataSource = CartDataSource(source: cartProduct)
    }
    
    func initCartTable() {
        tableView.dataSource = cartDataSource
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CartViewController.cellIdentifier)
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "삭제") { action, view, completionHandler in
            
            self.cartProduct?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .none)
            completionHandler(true)
        }
        
        let actions = [action]
        
        return UISwipeActionsConfiguration(actions: actions)
    }
}
