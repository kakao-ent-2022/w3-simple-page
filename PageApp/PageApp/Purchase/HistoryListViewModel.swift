//
//  PurchaseListViewModel.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/26.
//

import Foundation

protocol HistoryListViewModel {
    var histories: [HistoryModel] { get }
    func numberOfRowsInSection(_ section: Int) -> Int
    func get(at index: Int) -> HistoryModel
    func all() -> [HistoryModel]
    func remove(at index: Int)
    func append(_ history: HistoryModel)
}


class HistoryListViewModelImpl: HistoryListViewModel {
    var histories: [HistoryModel]
    
    init(histories: [HistoryModel] = []) {
        self.histories = histories    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return histories.count
    }
    
    func all() -> [HistoryModel] {
        return histories
    }
    
    func get(at index: Int) -> HistoryModel {
        return histories[index]
    }
    
    func remove(at index: Int) {
        histories.remove(at: index)
    }
    
    func append(_ history: HistoryModel) {
        histories.append(history)
    }
}
