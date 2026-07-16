//
//  Lab1Tests.swift
//  Lab1Tests
//

import XCTest
@testable import Lab1

class Lab1Tests: XCTestCase {
    private var controller: ViewController!
    private var originalPrice: UITextField!
    private var discount: UITextField!
    private var salesTax: UITextField!
    private var finalPrice: UILabel!

    override func setUp() {
        super.setUp()
        controller = ViewController()
        originalPrice = UITextField()
        discount = UITextField()
        salesTax = UITextField()
        finalPrice = UILabel()
        controller.originalPrice = originalPrice
        controller.discount = discount
        controller.salesTax = salesTax
        controller.finalPrice = finalPrice
    }

    override func tearDown() {
        controller = nil
        originalPrice = nil
        discount = nil
        salesTax = nil
        finalPrice = nil
        super.tearDown()
    }

    func testUpdateFinalPriceAppliesDiscountThenTax() {
        controller.originalPrice.text = "100"
        controller.discount.text = "20"
        controller.salesTax.text = "10"

        controller.updateFinalPrice()

        XCTAssertEqual(controller.finalPrice.text, "$88.00")
    }

    func testUpdateFinalPriceRejectsInvalidPercentages() {
        controller.originalPrice.text = "100"
        controller.discount.text = "150"
        controller.salesTax.text = "10"

        controller.updateFinalPrice()

        XCTAssertEqual(controller.finalPrice.text, "$???")
    }

    func testStandizeInputBoxFormatsWholeAndFractionalValues() {
        let field = UITextField()

        field.text = "12.0"
        controller.standizeInputBox(sender: field)
        XCTAssertEqual(field.text, "12")

        field.text = "12.345"
        controller.standizeInputBox(sender: field)
        XCTAssertEqual(field.text, "12.35")
    }
}
