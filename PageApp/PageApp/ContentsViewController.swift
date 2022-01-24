//
//  ViewController.swift
//  PageApp
//
//  Created by river.o on 2022/01/25.
//

import UIKit

class ContentsViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var contentTableView: UITableView!
    
    private let contentDataSource = ContentDataSource()
    lazy var contents = Content.jsonToContents()
        
    override func viewDidLoad() {
        super.viewDidLoad()
       
        initTableView()
    }
    
    fileprivate func initTableView() {
        contentTableView.delegate = self
        contentTableView.dataSource = contentDataSource
        contentDataSource.contents = contents
    }
}

