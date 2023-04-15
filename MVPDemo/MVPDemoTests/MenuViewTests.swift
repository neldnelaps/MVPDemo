//
//  MenuViewTests.swift
//  MVPDemoTests
//
//  Created by Natalia Pashkova on 15.04.2023.
//

import XCTest
@testable import MVPDemo

class MenuMockView: MenuViewController {
}

class MockCoordinator: ProjectCoordinator {
    var moveToDetailCalled = false
    var data : String = "Test Data"
    
    override func moveToDetail(withData data: String) {
        moveToDetailCalled = true
    }
}

final class MenuViewTests: XCTestCase {

    var menuPresenter: MenuPresenterProtocol!
    var menuCoordinator: MockCoordinator!
    var menuView: MenuMockView!
    var factory: Factory!
    
    override func setUp() {
        menuView = MenuMockView()
        factory = DependencyFactory(dependencies: DependencyFactory.Dependencies())
        menuCoordinator = MockCoordinator(factory: factory)
        menuPresenter = MenuPresenter(coordinator: menuCoordinator, view: menuView)
    }
    
    override func tearDown() {
        menuView = nil
        menuCoordinator = nil
        menuPresenter = nil
        factory = nil
    }
    
    func testInit() {
        XCTAssertNotNil(factory, "factory should not be nil")
        XCTAssertNotNil(menuPresenter, "Presenter should not be nil")
        XCTAssertEqual(menuPresenter.data, ["a", "b", "c", "d"], "Data should be set correctly")
        XCTAssertNotNil(menuView, "View should not be nil")
        XCTAssertNotNil(menuCoordinator, "Coordinator should not be nil")
    }
    
    func testShowDetail() {
        // Call showDetail method
        menuPresenter.showDetail(data: "Test Data")
        XCTAssertEqual(menuCoordinator.data, "Test Data")
    }

}
