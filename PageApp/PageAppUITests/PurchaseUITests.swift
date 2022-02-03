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
        XCTAssertEqual(purchaseItemsCount, 2)
        
        
        let firstPurchased = firstPurchaseItem.children(matching: .staticText).element(boundBy: 0).label
        XCTAssertTrue(cartTable.cells.containing(.staticText, identifier: firstPurchased).element.exists)
        let secondPurchased = secondPurchaseItem.children(matching: .staticText).element(boundBy: 0).label
        XCTAssertTrue(cartTable.cells.containing(.staticText, identifier: secondPurchased).element.exists)
        
    }
    
    func test_히스토리가_정상적으로_삭제되는지() throws{
                
        let app = XCUIApplication()

        let tableQuery = app.tables
        let firstPurchaseItem = tableQuery.cells.element(boundBy: 0)
        let secondPurchaseItem = tableQuery.cells.element(boundBy: 1)

        firstPurchaseItem.buttons["구매"].tap()
        secondPurchaseItem.buttons["구매"].tap()


        // open history view controller
        app.navigationBars["emoticon"].buttons["shopping cart"].tap()


        let firstPurchased = firstPurchaseItem.children(matching: .staticText).element(boundBy: 0).label
        tableQuery.cells.containing(.staticText, identifier:"모시던 아가씨가 도련님이 되어버렸다").element.swipeLeft()
        tableQuery.cells.containing(.staticText, identifier:"모시던 아가씨가 도련님이 되어버렸다").buttons["Delete"].tap()
        XCTAssertEqual(tableQuery.children(matching: .cell).count, 1)
        XCTAssertTrue(!tableQuery.cells.containing(.staticText, identifier: firstPurchased).element.exists)
        
    }

}
