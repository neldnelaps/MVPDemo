//
//  DetailViewTests.swift
//  MVPDemoTests
//
//  Created by Natalia Pashkova on 15.04.2023.
//

import XCTest
@testable import MVPDemo

class DetailMockView: DetailViewController {
}

final class DetailViewTests: XCTestCase {

    var detailPresenter: DetailPresenterProtocol!
    var detailView: DetailMockView!
    
    override func setUp() {
        detailView = DetailMockView(data: "Test data")
        detailPresenter = DetailPresenter(view: detailView)
    }
    
    override func tearDown() {
        detailView = nil
        detailPresenter = nil
    }

    func testInit() {
        XCTAssertNotNil(detailPresenter, "Presenter should not be nil")
        XCTAssertNotNil(detailView, "View should not be nil")
    }

}
