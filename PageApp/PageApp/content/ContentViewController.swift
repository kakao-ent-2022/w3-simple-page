//
//  ViewController.swift
//  PageApp
//
//  Created by river.o on 2022/01/25.
//

import UIKit


enum ContentConstant {
    static let moveCartVCSegue = "moveCartVC"
}

extension Notification.Name {
    static let onPurchaseContent = Notification.Name("purchaseContent")
}

class ContentViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var contentTableView: UITableView!
    
    private let contentDataSource = ContentDataSource()
    private lazy var contents = Content.jsonToContents()
        
    private let notificationCenter: NotificationCenter = .default
    private let operatoinQueue = OperationQueue()
    private lazy var cartTrade: Tradable = CartTrade()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        initNavigationBar()
        initTableView()
        initObserve()
    }
    
    private func initObserve() {
        notificationCenter.addObserver(
            forName: Notification.Name.onPurchaseContent,
            object: nil,
            queue: operatoinQueue
        ) { (notification) in
            if let cart = notification.object as? Cart {
                self.cartTrade.buy(cart: cart)
            }
        }
    }
    
    private func initNavigationBar() {
        navigationItem.title = "Content Page"
        
        let cartButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "cart.fill"), for: .normal)
            button.addTarget(self, action: #selector(moveToCartVC), for: .touchUpInside)
            return button
        }()
        let cartBarButton = UIBarButtonItem(customView: cartButton)
        navigationItem.rightBarButtonItem = cartBarButton
    }
    
    @objc func moveToCartVC() {
        performSegue(withIdentifier: ContentConstant.moveCartVCSegue, sender: nil)
    }
    
    private func initTableView() {
        contentTableView.delegate = self
        contentTableView.dataSource = contentDataSource
        contentDataSource.contents = contents
    }
}

