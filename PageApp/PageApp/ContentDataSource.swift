//
//  ContentDataSource.swift
//  PageApp
//
//  Created by river.o on 2022/01/25.
//

import UIKit

enum CellConstant {
    static let basicContentCell = "BasicContentCell"
}

class ContentDataSource: NSObject, UITableViewDataSource {

    var contents: [Content] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellConstant.basicContentCell) else {
            fatalError("no cell")
        }
        
        cell.textLabel?.text = contents[indexPath.row].title
        cell.detailTextLabel?.text = contents[indexPath.row].author
        
        return cell
    }
}
