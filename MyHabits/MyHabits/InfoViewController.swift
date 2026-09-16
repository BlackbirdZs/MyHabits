//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Anton Kruglov on 15.09.2026.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    func setupTabBar() {
        tabBarItem.title = "Info"
        tabBarItem.image = UIImage(systemName: "info.circle.fill")
    }
}
