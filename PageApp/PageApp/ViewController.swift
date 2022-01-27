//
//  ViewController.swift
//  PageApp
//
//  Created by nylah.j on 2022/01/24.
//

import UIKit

class ViewController: UIViewController {
    private let novelDataSource = NovelDataSource()
    
    @IBOutlet weak var novelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initNovelTableView()
    }
    
    func initNovelTableView() {
        novelTableView.dataSource = novelDataSource
    }
}
