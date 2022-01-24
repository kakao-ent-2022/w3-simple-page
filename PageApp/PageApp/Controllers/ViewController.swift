//
//  ViewController.swift
//  PageApp
//
//  Created by terry.yes on 2022/01/24.
//

import UIKit

class ViewController: UIViewController {
    let webtoonListViewModel = WebtoonListViewModel()
    let purchaseViewModel = PurchaseListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webtoonListViewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WebtoonListCell", for: indexPath) as? WebtoonTableViewCell else {
            return UITableViewCell()
        }
        let webtoonViewModel = self.webtoonListViewModel.webtoonAtIndex(indexPath.row)
        cell.configure(webtoonViewModel: webtoonViewModel)
        return cell
    }
}
