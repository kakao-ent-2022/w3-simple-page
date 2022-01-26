//
//  PurchaseListViewModel.swift
//  PageApp
//
//  Created by lauren.c on 2022/01/26.
//

import Foundation

protocol HistoryListViewModel {
    func numberOfRowsInSection(_ section: Int) -> Int
    func get(at index: Int) -> HistoryModel
    mutating func remove(at index: Int) -> Void
}


struct HistoryListViewModelImpl: HistoryListViewModel {
    var histories: [HistoryModel]
    
    init(histories: [HistoryModel]) {
        self.histories = histories
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return histories.count
    }
    
    func get(at index: Int) -> HistoryModel {
        return histories[index]
    }
    
    mutating func remove(at index: Int) {
        histories.remove(at: index)
    }
}
