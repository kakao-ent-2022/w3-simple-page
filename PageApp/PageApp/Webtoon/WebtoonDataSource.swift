//
//  WebtoonDataSource.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/24.
//

import UIKit

class WebtoonDataSource: NSObject, UITableViewDataSource {
    var list: [WebtoonModel] = []
    
    override init() {
        super.init()
        if let data = try? getData() {
            list = data
        }
    }
    
    private func getData() throws -> [WebtoonModel]? {
        guard let path = Bundle.main.path(forResource: "webtoons", ofType: "json"),
            let jsonString = try? String(contentsOfFile: path) else {
                throw CommonError.DataError
        }
        
        let decoder = JSONDecoder()
        let data = jsonString.data(using: .utf8)
        
        if let data = data, let webtoon = try? decoder.decode([WebtoonModel].self, from: data) {
            list = webtoon
        }
        throw CommonError.DataError
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return list.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath) as! WebtoonCell
        cell.titleLabel.text = item.title
        cell.authorLabel.text = item.author
        cell.picture.image = item.image
        cell.webtoonModel = item
        cell.selectionStyle = .none
        return cell
    }
    
}



