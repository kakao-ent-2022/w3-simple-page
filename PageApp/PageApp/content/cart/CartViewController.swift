//
//  CartTableViewController.swift
//  PageApp
//
//  Created by river.o on 2022/01/26.
//

import UIKit

enum CartConstant {
    static let basicCartCell = "BasicCartCell"
    static let navigationTitle = "Purchase History"
}

class CartViewController: UITableViewController {
    
    var cartTrade: Tradable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationBar()
    }

    private func initNavigationBar() {
        navigationItem.title = CartConstant.navigationTitle
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartTrade?.getListCount() ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartConstant.basicCartCell) else {
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


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
