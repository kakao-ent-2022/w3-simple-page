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
    
    func testPurchaseIsAddedToPurchaseHistory() {
        // given
        let webtoon = Webtoon(title: "testTitle", author: "testAuthor", image: "testImage")
        let purchase = Purchase(webtoonTitle: webtoon.title, date: Date())
        
        // when
        purchaseHistory.add(purchase: purchase)
        
        // then
        let result = purchaseHistory.get(at: 0)
        XCTAssertEqual(purchase, result)
    }
    
    func testPurchaseHistoryRemovePruchase() {
        // given
        let webtoon = Webtoon(title: "testTitle", author: "testAuthor", image: "testImage")
        let purchase = Purchase(webtoonTitle: webtoon.title, date: Date())
        purchaseHistory.add(purchase: purchase)
        
        // when, then
        XCTAssertNoThrow(try purchaseHistory.remove(purchase: purchase), "PurchaseHistory.remove() fail")
    }
}
