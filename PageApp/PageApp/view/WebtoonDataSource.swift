//
//  NovelDataSource.swift
//  PageApp
//
//  Created by nylah.j on 2022/01/24.
//

import Foundation
import UIKit

class WebtoonDataSource: NSObject, UITableViewDataSource {
    private let cellIdentifier = "cell"
    private var purchaseButtonAction: ((Webtoon) -> ())?
    
    let webtoons: [Webtoon]
    
    init(source: [Webtoon], purchaseButtonAction: @escaping (Webtoon) -> ()) {
        webtoons = source
        self.purchaseButtonAction = purchaseButtonAction
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webtoons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        as! WebtoonTableViewCell
        
        let webtoon = webtoons[indexPath.row]
        cell.bindWebtoon(webtoon: webtoon)
        
        if purchaseButtonAction != nil {
            cell.setPurchaseButtonAction {
                self.purchaseButtonAction!(webtoon)
            }
        }

        return cell
    }
}
