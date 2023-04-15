//
//  RootCoordinator.swift
//  MVPDemo
//
//  Created by Natalia Pashkova on 14.04.2023.
//

import Foundation
import UIKit

/// Root Coordinator
protocol RootCoordinator: AnyObject {
    func start(_ navigationController: UINavigationController)
}
