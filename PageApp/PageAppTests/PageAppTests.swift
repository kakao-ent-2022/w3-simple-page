//
//  PageAppTests.swift
//  PageAppTests
//
//  Created by terry.yes on 2022/01/24.
//

import XCTest
@testable import PageApp

class PageAppTests: XCTestCase {

    var sut: PurchaseListViewModel!
    var webtoonListVM: WebtoonListViewModel!
    
    override func setUpWithError() throws {
        self.sut = PurchaseListViewModel()
        self.webtoonListVM = WebtoonListViewModel()
    }
    
    func test_구매기록이_잘_추가되는지() throws {
        sut.makePurchase(webtoon: webtoonListVM.webtoonAtIndex(0))
        sut.makePurchase(webtoon: webtoonListVM.webtoonAtIndex(1))
        sut.makePurchase(webtoon: webtoonListVM.webtoonAtIndex(2))
        
        XCTAssertEqual(sut.purchaseCount, 3)
    }
    
    func test_구매기록이_잘_삭제되는지() throws {
        sut.makePurchase(webtoon: webtoonListVM.webtoonAtIndex(0))
        sut.makePurchase(webtoon: webtoonListVM.webtoonAtIndex(1))
        sut.makePurchase(webtoon: webtoonListVM.webtoonAtIndex(2))
        sut.remove(at: 0)
        
        XCTAssertEqual(sut.purchaseCount, 2)
        
    }
    
    func test_모든_구매기록이_한번에_삭제되는지() throws {
        sut.makePurchase(webtoon: webtoonListVM.webtoonAtIndex(0))
        sut.makePurchase(webtoon: webtoonListVM.webtoonAtIndex(1))
        sut.makePurchase(webtoon: webtoonListVM.webtoonAtIndex(2))
        sut.removeAll()
        
        XCTAssertEqual(sut.purchaseCount, 0)
    }

    override func tearDownWithError() throws {
        self.sut = nil
        self.webtoonListVM = nil
    }
}
