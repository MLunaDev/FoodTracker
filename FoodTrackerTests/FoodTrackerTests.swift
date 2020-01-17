//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Diogo, Mariana.
//  Copyright © 2020 Luna. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    //MARK: Meal Class Tests

    // Confirm that the Meal initializer returns a Meal object when passed valid parameters.
    func testMealInitializationSucceedsWithZeroRating() {
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
    }
    
    func testMealInitializationWSucceedsithHighRating() {
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    // Confirm that the Meal initializer returns a nil object when passed invalid parameters.
    func testMealInitializationFailsWithNegativeRating() {
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: -9)
        XCTAssertNil(zeroRatingMeal)
    }
    func testMealInitializationFailsWithEmptyName() {
        let zeroRatingMeal = Meal.init(name: "", photo: nil, rating: 3)
        XCTAssertNil(zeroRatingMeal)
    }

    func testMealInitializationWithExceedingRating() {
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
    }
}
