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
    
    let novels = WebtoonJsonData.convertAsNovel()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return novels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        as! WebtoonTableViewCell
        
        let row = indexPath.row
        let thumbnail = novels[row].image
        cell.thumbnailImageView.image = UIImage(named: thumbnail)
        cell.titleLabel.text = novels[row].title
        cell.authorLabel.text = novels[row].author
        
        return cell
    }
}
