//
//  Lab2Tests.swift
//  Lab2Tests
//

import XCTest
@testable import Lab2

class Lab2Tests: XCTestCase {
    func testPetFeedPlayAndEvolveRules() {
        let pet = Pet(_name: "Pixel", _type: .cat)

        XCTAssertTrue(pet.feed(increment: 12))
        XCTAssertEqual(pet.foodLevel, 10)
        XCTAssertEqual(pet.fed, 1)

        XCTAssertTrue(pet.collectHappiness(increment: 12))
        XCTAssertEqual(pet.happiness, 10)

        XCTAssertTrue(pet.evolve())
        XCTAssertTrue(pet.isEvolved)
        XCTAssertEqual(pet.foodLevel, 5)
        XCTAssertEqual(pet.happiness, 5)
        XCTAssertFalse(pet.evolve())
    }

    func testPetCannotPlayWithoutEnoughFood() {
        let pet = Pet(_name: "Pixel", _type: .dog)

        XCTAssertFalse(pet.play())
        XCTAssertEqual(pet.played, 0)
        XCTAssertEqual(pet.foodLevel, 0)
        XCTAssertEqual(pet.happiness, 0)
    }

    func testShopItemUseAppliesEffectsAndStoresRecentItem() {
        let pet = Pet(_name: "Pixel", _type: .bird)
        let item = ShopItem(_name: "snack", _type: .food, _price: -5, food: 2, happiness: 3)

        XCTAssertEqual(item.price, 0)
        XCTAssertTrue(item.use(pet: pet))
        XCTAssertEqual(pet.foodLevel, 2)
        XCTAssertEqual(pet.happiness, 3)
        XCTAssertEqual(pet.recentItem, item)
    }

    func testPlayerPurchasingUsingAndBoundsChecks() {
        let player = Player(_coin: 10, items: [1, 0, 0, 0])
        let pet = Pet(_name: "Pixel", _type: .fish)

        player.buyItem(itemIndex: 0)
        XCTAssertEqual(player.coin, 0)
        XCTAssertEqual(player.bag[0], 2)

        player.buyItem(itemIndex: 1)
        XCTAssertEqual(player.coin, 0)
        XCTAssertEqual(player.bag[1], 0)

        player.useItem(itemIndex: 0, pet: pet)
        XCTAssertEqual(player.bag[0], 1)
        XCTAssertEqual(pet.foodLevel, 1)

        player.buyItem(itemIndex: player.bag.count)
        player.useItem(itemIndex: -1, pet: pet)
        XCTAssertEqual(player.coin, 0)
        XCTAssertEqual(player.bag[0], 1)
    }
}
