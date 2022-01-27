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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellConstant.basicContentCell) as? ContentBasicCell else {
            fatalError("no cell")
        }
        
        let content = contents[indexPath.row]
        cell.bind(content: content)
        
        return cell
    }
}
