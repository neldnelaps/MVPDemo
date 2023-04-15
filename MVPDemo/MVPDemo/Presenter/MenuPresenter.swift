//
//  MenuPresenter.swift
//  MVPDemo
//
//  Created by Natalia Pashkova on 14.04.2023.
//

import Foundation

@objc protocol MenuPresenterProtocol {
    var data: [String] { get }
    func buttonPressed()
    func showDetail(data: String)
}

class MenuPresenter {
    let data = ["a", "b", "c", "d"]
    weak private var view: MenuViewController?
    private var coordinator: ProjectCoordinator?
    
    @objc func buttonPressed() {
        print("Button Pressed")
    }
    
    init(coordinator: ProjectCoordinator, view: MenuViewController) {
        self.coordinator = coordinator
        self.view = view
    }
    
    func showDetail(data: String) {
        coordinator?.moveToDetail(withData: data)
    }
}

extension MenuPresenter: MenuPresenterProtocol { }
