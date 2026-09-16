//
//  SceneDelegate.swift
//  MyHabits
//
//  Created by Anton Kruglov on 14.09.2026.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: scene)

        let habitsViewController = HabitsViewController()
        let infoViewController = InfoViewController()

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [habitsViewController, infoViewController]

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
}
