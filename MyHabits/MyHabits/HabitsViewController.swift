//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Anton Kruglov on 15.09.2026.
//

import UIKit

class HabitsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupNavigationItem()
    }

    func setupView() {
        view.backgroundColor = .systemGroupedBackground
    }

    private func setupNavigationItem() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonPressed))
        navigationItem.rightBarButtonItem?.tintColor = .systemPurple
    }

    @objc func addButtonPressed() {
        let habitViewController = HabitViewController()
        let navigationController = UINavigationController(rootViewController: habitViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}
