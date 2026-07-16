//
//  Lab3Tests.swift
//  Lab3Tests
//

import XCTest
@testable import Lab3

class Lab3Tests: XCTestCase {
    func testBoardPathStoresStrokeConfiguration() {
        let points = [CGPoint(x: 1, y: 2), CGPoint(x: 3, y: 4)]
        let boardPath = BoardPath(points: points, thickness: 8, color: .red, alpha: 0.5)

        XCTAssertEqual(boardPath.points.count, 2)
        XCTAssertEqual(boardPath.thickness, 8)
        XCTAssertTrue(boardPath.color.isEqual(UIColor.red))
        XCTAssertEqual(boardPath.alpha, 0.5)
    }

    func testCreateQuadPathReturnsEmptyPathForSinglePoint() {
        let pathView = PathView(frame: .zero)
        let path = pathView.createQuadPath(points: [CGPoint(x: 10, y: 10)])

        XCTAssertTrue(path.cgPath.isEmpty)
    }

    func testCreateQuadPathEndsAtLastPoint() {
        let pathView = PathView(frame: .zero)
        let lastPoint = CGPoint(x: 30, y: 20)
        let path = pathView.createQuadPath(points: [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 20, y: 10),
            lastPoint
        ])

        XCTAssertFalse(path.cgPath.isEmpty)
        XCTAssertEqual(path.currentPoint, lastPoint)
    }

    func testCreateDotBuildsExpectedBounds() {
        let pathView = PathView(frame: .zero)
        let dot = pathView.createDot(point: CGPoint(x: 10, y: 10), radius: 4)

        XCTAssertEqual(dot.bounds, CGRect(x: 6, y: 6, width: 8, height: 8))
    }
}
