//
//  PageAppTests.swift
//  PageAppTests
//
//  Created by nylah.j on 2022/01/25.
//

import XCTest
@testable import PageApp

class PageAppTests: XCTestCase {
    
    var purchaseHistory: PurchaseHistory!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        purchaseHistory = PurchaseHistory()
    }
    
    override func tearDownWithError() throws {
        purchaseHistory = nil
        try super.tearDownWithError()
    }
    
    func testExample() throws {
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_webtoon구매했을때_PurchaseHisotry에_추가() {
        // given
        let webtoon = Webtoon(title: "testTitle", author: "testAuthor", image: "testImage")
        
        // when
        purchaseHistory.makePurchase(webtoon: webtoon)
        
        // then
        let result = purchaseHistory.get(at: 0)
        XCTAssertEqual(webtoon.title, result?.webtoonTitle)
    }
    
    func testPurchaseHistoryRemovePruchase() {
        // given
        let webtoon = Webtoon(title: "testTitle", author: "testAuthor", image: "testImage")
        
        // when
        purchaseHistory.makePurchase(webtoon: webtoon)
        
        // then
        XCTAssertNoThrow(purchaseHistory.remove(at: 0), "PurchaseHistory.remove() fail")
    }
}
