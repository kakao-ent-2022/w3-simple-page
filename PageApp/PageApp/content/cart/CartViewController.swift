//
//  CartTableViewController.swift
//  PageApp
//
//  Created by river.o on 2022/01/26.
//

import UIKit

class CartViewController: UITableViewController {
    
    let basicCartCell = "BasicCartCell"
    let navigationTitle = "Purchase History"
    
    var cartTrade: Tradable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationBar()
    }

    private func initNavigationBar() {
        navigationItem.title = navigationTitle
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartTrade?.getListCount() ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: basicCartCell) else {
            fatalError("no cell")
        }
        
        guard let cartTrade = cartTrade else {
            fatalError("no cart trade")
        }
        
        guard let cart = cartTrade.getCartByIndex(index: indexPath.row) else {
            fatalError("no cart")
        }
        
        cell.textLabel?.text = cart.title
        cell.detailTextLabel?.text = cart.purchaseDate

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cartTrade?.delete(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
