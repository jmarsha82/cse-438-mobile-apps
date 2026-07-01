//
//  Lab4Tests.swift
//  Lab4Tests
//

import XCTest
@testable import Lab4

class Lab4Tests: XCTestCase {
    func testInfoStoresMovieSearchResultFields() {
        let info = Info(name: "The Matrix", imdbID: "tt0133093", url: "https://example.com/poster.jpg")

        XCTAssertEqual(info.name, "The Matrix")
        XCTAssertEqual(info.imdbID, "tt0133093")
        XCTAssertEqual(info.url, "https://example.com/poster.jpg")
    }

    func testCollectionViewSectionsAreGroupedByRowsOfThree() {
        let controller = FirstViewController()
        controller.theData = [
            Info(name: "A", imdbID: "1", url: "u1"),
            Info(name: "B", imdbID: "2", url: "u2"),
            Info(name: "C", imdbID: "3", url: "u3"),
            Info(name: "D", imdbID: "4", url: "u4"),
            Info(name: "E", imdbID: "5", url: "u5"),
            Info(name: "F", imdbID: "6", url: "u6")
        ]

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        XCTAssertEqual(controller.numberOfSections(in: collectionView), 2)
    }

    func testCollectionViewIgnoresIncompleteTrailingRow() {
        let controller = FirstViewController()
        controller.theData = [
            Info(name: "A", imdbID: "1", url: "u1"),
            Info(name: "B", imdbID: "2", url: "u2"),
            Info(name: "C", imdbID: "3", url: "u3"),
            Info(name: "D", imdbID: "4", url: "u4")
        ]

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        XCTAssertEqual(controller.numberOfSections(in: collectionView), 1)
    }
}
