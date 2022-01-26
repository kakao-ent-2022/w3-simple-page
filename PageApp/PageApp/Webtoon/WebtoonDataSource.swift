//
//  WebtoonDataSource.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/24.
//

import UIKit

class WebtoonDataSource: NSObject, UITableViewDataSource {
    var webtoonVM: WebtoonListViewModel
    
    override init() {
        webtoonVM = WebtoonListViewModelImpl()
        super.init()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webtoonVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = webtoonVM.get(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath) as! WebtoonCell
        cell.titleLabel.text = item.title
        cell.authorLabel.text = item.author
        cell.picture.image = item.image
        cell.webtoonModel = item
        cell.selectionStyle = .none
        return cell
    }
    
}



