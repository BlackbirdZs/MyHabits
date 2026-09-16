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
        habitsViewController.tabBarItem = UITabBarItem(
            title: "Привычки",
            image: UIImage(systemName: "rectangle.split.1x2.fill"),
            tag: 0
        )
        let habitsNavigationController = UINavigationController(rootViewController: habitsViewController)

        let infoViewController = InfoViewController()
        infoViewController.tabBarItem = UITabBarItem(
            title: "Информация",
            image: UIImage(systemName: "info.circle.fill"),
            tag: 1
        )
        let infoNavigationController = UINavigationController(rootViewController: infoViewController)

        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .systemPurple
        tabBarController.viewControllers = [habitsNavigationController, infoNavigationController]

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
}
