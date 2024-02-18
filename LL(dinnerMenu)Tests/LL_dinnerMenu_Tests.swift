//
//  LL_dinnerMenu_Tests.swift
//  LL(dinnerMenu)Tests
//
//  Created by Anatoliy Petrov on 18.2.24..
//

import XCTest
@testable import LL_dinnerMenu_

final class LL_dinnerMenu_Tests: XCTestCase {
    let viewModel = MenuViewViewModel()
    
    func test_checkFoodTitle() {
        let foodTitle = viewModel.foods[3]
        XCTAssertEqual(foodTitle.title, "Food 4")
    }
    
    func test_checkIngredient() {
        let foodIngredient = viewModel.foods[3]
        XCTAssertEqual(foodIngredient.ingredients, [.broccoli, .spinach])
    }


}
