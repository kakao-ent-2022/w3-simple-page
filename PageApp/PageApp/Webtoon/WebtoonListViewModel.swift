//
//  WebtoonViewModel.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/26.
//

import Foundation

protocol WebtoonListViewModel {
    var webtoons: [WebtoonModel] { get }
    func numberOfRowsInSection(_ section: Int) -> Int
    func get(at index: Int) -> WebtoonModel
    mutating func remove(at index: Int)
    mutating func updatePurchaseStatus(from historiesVM: HistoryListViewModel)
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
    
    mutating func updatePurchaseStatus(from historiesVM: HistoryListViewModel) {
        for webtoon in webtoons {
            if let _ = historiesVM.all().first(where: { $0.name == webtoon.title }) {
                webtoon.isPurchased = true
            } else {
                webtoon.isPurchased = false
            }
        }
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
