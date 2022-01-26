//
//  PurchaseDataSource.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/25.
//

import UIKit


class PurchaseDataSource: NSObject, UITableViewDataSource {
    var data: [PurchaseModel] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        var content = UIListContentConfiguration.valueCell()
        content.text = item.name
        content.secondaryText = item.createdAt
        cell.contentConfiguration = content
        return cell
    }
}
