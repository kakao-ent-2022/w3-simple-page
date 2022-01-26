//
//  CartTests.swift
//  CartTests
//
//  Created by river.o on 2022/01/26.
//

import XCTest
@testable import PageApp

class CartTradeTests: XCTestCase {
    
    private lazy var sut: Tradable = CartTrade()
    
    override func setUpWithError() throws {
        sut.reset(
            carts: [Cart(title: "환골탈태"),
                    Cart(title: "압도적 그대"),
                    Cart(title: "용이 비를 내리는 나라")])
    }

    func 작품_구매_테스트() throws {
        // given
        let cart = Cart(title: "여주 죽고 미친 남주의 친구입니다")
        
        // when
        sut.buy(cart: cart)
        
        // then
        XCTAssertEqual(sut.getListCount(), 4)
        XCTAssertEqual(sut.getList().last?.title, "여주 죽고 미친 남주의 친구입니다")
    }
    
    func 작품_전체_개수_테스트() throws {
        // then
        XCTAssertEqual(sut.getListCount(), 3)
    }
    
    func 두번째_작품_구매이력_테스트() throws {
        // when
        let secondContent = sut.getCartByIndex(index: 2-1)
        
        XCTAssertEqual(secondContent?.title, "압도적 그대")
    }
}
