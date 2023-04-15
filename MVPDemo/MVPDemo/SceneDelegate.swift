//
//  SceneDelegate.swift
//  MVPDemo
//
//  Created by Natalia Pashkova on 13.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        let rootNavigationController = UINavigationController()
        let container = DependencyFactory(dependencies: .init())
        let coordinator = container.makeInitialCoordinator()
        
        coordinator.start(rootNavigationController)
        
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }

}

