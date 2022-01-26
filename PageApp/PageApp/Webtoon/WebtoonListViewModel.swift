//
//  WebtoonViewModel.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/26.
//

import Foundation

protocol WebtoonListViewModel {
    func numberOfRowsInSection(_ section: Int) -> Int
    func get(at index: Int) -> WebtoonModel
    mutating func remove(at index: Int) -> Void
}

struct WebtoonListViewModelImpl: WebtoonListViewModel {
    var webtoons: [WebtoonModel]
    
    init() {
        webtoons = try! WebtoonListViewModelImpl.getData() ?? []
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return webtoons.count
    }
    
    func get(at index: Int) -> WebtoonModel {
        return webtoons[index]
    }
    
    mutating func remove(at index: Int) {
        webtoons.remove(at: index)
    }
    
    private static func getData() throws -> [WebtoonModel]? {
        guard let path = Bundle.main.path(forResource: "webtoons", ofType: "json"),
            let jsonString = try? String(contentsOfFile: path) else {
                throw CommonError.DataError
        }
        
        let decoder = JSONDecoder()
        let data = jsonString.data(using: .utf8)
        
        if let data = data, let webtoon = try? decoder.decode([WebtoonModel].self, from: data) {
            return webtoon
        }
        throw CommonError.DataError
    }
    
    
}
