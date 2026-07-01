//
//  Lab2Tests.swift
//  Lab2Tests
//

import SpriteKit
import XCTest
@testable import Lab2

class Lab2Tests: XCTestCase {
    func testPetModelStillSupportsLab2CareLoop() {
        let pet = Pet(_name: "Pixel", _type: .bunny)
        let player = Player(_coin: 10, items: [1, 0, 0, 0])

        XCTAssertTrue(pet.feed(increment: 2))
        XCTAssertTrue(pet.play())
        XCTAssertEqual(pet.foodLevel, 1)
        XCTAssertEqual(pet.happiness, 1)

        player.useItem(itemIndex: 0, pet: pet)
        XCTAssertEqual(player.bag[0], 0)
        XCTAssertEqual(pet.foodLevel, 2)
        XCTAssertEqual(pet.happiness, 1.5)
    }

    func testPlayerBoundsChecksDoNotMutateInventory() {
        let player = Player(_coin: 100, items: [0, 0, 0, 0])
        let pet = Pet(_name: "Pixel", _type: .cat)

        player.buyItem(itemIndex: player.bag.count)
        player.buyItem(itemIndex: -1)
        player.useItem(itemIndex: player.bag.count, pet: pet)
        player.useItem(itemIndex: -1, pet: pet)

        XCTAssertEqual(player.coin, 100)
        XCTAssertEqual(player.bag, [0, 0, 0, 0])
        XCTAssertEqual(pet.foodLevel, 0)
    }

    func testGameSceneSnowToggleAddsAndRemovesEmitter() {
        let scene = GameScene(size: CGSize(width: 320, height: 480))
        let emitter = SKEmitterNode()
        scene.snowNode = emitter

        scene.switchSnow()
        XCTAssertTrue(scene.ifSnow)
        XCTAssertTrue(emitter.parent === scene)

        scene.switchSnow()
        XCTAssertFalse(scene.ifSnow)
        XCTAssertNil(emitter.parent)
    }
}
