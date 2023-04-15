//
//  AbstractCoordinator.swift
//  MVPDemo
//
//  Created by Natalia Pashkova on 14.04.2023.
//

import Foundation

protocol AbstractCoordinator {
    func addChildCoordinator(_ coordinator: AbstractCoordinator)
    func removeAllChildCoordinatorsWith<T>(type: T.Type)
    func removeAllChildCoordinators()
}
