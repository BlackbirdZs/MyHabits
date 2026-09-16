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

        setupView()
        setupNavigationItem()
    }

    private func setupView() {
        view.backgroundColor = .white
    }

    private func setupNavigationItem() {
        navigationItem.title = "Информация"
    }
}
