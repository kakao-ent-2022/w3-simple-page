//
//  ViewController.swift
//  PageApp
//
//  Created by nylah.j on 2022/01/24.
//

import UIKit

class ViewController: UIViewController {
    private let novelDataSource = NovelDataSource()
    let novelTableView = UITableView()

    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        initNovelTableView()
    }
    
    func initNovelTableView() {
        novelTableView.dataSource = novelDataSource
        novelTableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(novelTableView)
        
        novelTableView.translatesAutoresizingMaskIntoConstraints = false
        
        novelTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        novelTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        novelTableView.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor).isActive =  true
        novelTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}
