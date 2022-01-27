//
//  ViewController.swift
//  PageApp
//
//  Created by nylah.j on 2022/01/24.
//

import UIKit

class WebtoonViewController: UIViewController, SendPurchaseHoldableDelegate {

    let novelTableView = UITableView()
    @IBOutlet weak var bannerImageView: UIImageView!
    
    private let purchaseHistory = PurchaseHistory()
    let notificatiCenter = NotificationCenter()
    var novelDataSource: WebtoonDataSource!
    let purchaseNotification = NSNotification.Name("purchaseNotification")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPurchaseNotification()
        initWebtoonDataSource()
        initCartButton()
        initNovelTableView()
    }
    
    func initPurchaseNotification() {
        notificatiCenter.addObserver(
            self,
            selector: #selector(didReceivePurchaseNotification(_:)),
            name: purchaseNotification,
            object: nil
        )
    }
    
    @objc func didReceivePurchaseNotification(_ notification: Notification) {
        if notification.name != purchaseNotification {
            return
        }
        
        guard let webtoon = notification.userInfo?["webtoon"] as? Webtoon
        else {
            return
        }
        
        purchaseHistory.makePurchase(webtoon: webtoon)
    }
    
    func initWebtoonDataSource() {
        let webtoons = WebtoonJsonData.convertAsWebtoon()
        
        novelDataSource = WebtoonDataSource(
            source: webtoons,
            purchaseButtonAction: { webtoon in
                self.notificatiCenter.post(
                    name: self.purchaseNotification,
                    object: nil,
                    userInfo: ["webtoon" : webtoon])
            })
    }
    
    func initCartButton() {
        let barbuttonImage = UIImage(named: "cart")
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: barbuttonImage,
            style: .plain,
            target: self,
            action: #selector(onCartButtonTouched)
        )
    }
    
    @objc func onCartButtonTouched() {
        
        guard let cartViewController = storyboard?.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController
        else {
            return
        }
        cartViewController.delegate = self
        navigationController?.pushViewController(cartViewController, animated: true )
    }
    
    func initNovelTableView() {
        novelTableView.dataSource = novelDataSource
        novelTableView.register(WebtoonTableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(novelTableView)
        
        novelTableView.translatesAutoresizingMaskIntoConstraints = false
        
        novelTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        novelTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        novelTableView.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor).isActive =  true
        novelTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func send() -> PurchaseHoldable {
        return purchaseHistory
    }
}
