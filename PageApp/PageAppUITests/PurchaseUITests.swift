//
//  PurchaseUITests.swift
//  PageAppUITests
//
//  Created by lauren.c on 2022/01/25.
//

import XCTest
import PageApp

class PurchaseUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_정상적으로_구매_히스토리를_저장하는지() throws {
        
        let app = XCUIApplication()
        
        let listTable = app.tables.element(boundBy: 0)
        let firstPurchaseItem = listTable.cells.element(boundBy: 0)
        let secondPurchaseItem = listTable.cells.element(boundBy: 1)
        
        firstPurchaseItem.buttons["구매"].tap()
        secondPurchaseItem.buttons["구매"].tap()
        secondPurchaseItem.buttons["구매"].tap()

        
        // open history view controller
        app.navigationBars["emoticon"].buttons["shopping cart"].tap()
        
        let cartTable = app.tables.element(boundBy: 1)
        let purchaseItemsCount = cartTable.children(matching: .cell).count
        XCTAssertEqual(purchaseItemsCount, 3)
        
        
        let firstPurchased = firstPurchaseItem.children(matching: .staticText).element(boundBy: 0).label
        XCTAssertEqual(cartTable.cells.containing(.staticText, identifier: firstPurchased).count, 1)

        let secondPurchased = secondPurchaseItem.children(matching: .staticText).element(boundBy: 0).label
        XCTAssertEqual(cartTable.cells.containing(.staticText, identifier: secondPurchased).count, 2)
        
    }

}
