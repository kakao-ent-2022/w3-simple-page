//
//  ViewController.swift
//  PageApp
//
//  Created by nylah.j on 2022/01/24.
//

import UIKit

class ViewController: UIViewController {
    private let novelDataSource = WebtoonDataSource()
    let novelTableView = UITableView()

    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCartButton()
        
        initNovelTableView()
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
        guard let cartViewController = storyboard?.instantiateViewController(withIdentifier: "CartViewController")
        else {
            return
        }
        navigationController?.pushViewController(cartViewController, animated: true)
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
}
