//
//  ViewController.swift
//  PageApp
//
//  Created by terry.yes on 2022/01/24.
//

import UIKit

class ViewController: UIViewController {
    let webtoonListViewModel = WebtoonListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        webtoonListViewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WebtoonListCell", for: indexPath)
        let webtoonViewModel = self.webtoonListViewModel.webtoonAtIndex(indexPath.row)
        
        cell.textLabel?.text = webtoonViewModel.title
        cell.detailTextLabel?.text = webtoonViewModel.author
        return cell
    }
    
    
}
