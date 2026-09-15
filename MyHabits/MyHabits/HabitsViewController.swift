//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Anton Kruglov on 15.09.2026.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.clipsToBounds = true
        addButton.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        addButton.tintColor = .purple
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        
        return addButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setupTabBar()
        setupConstraints()
    }
    
    func setupTabBar() {
        tabBarItem.title = "Habits"
        tabBarItem.image = UIImage(systemName: "rectangle.split.1x2.fill")
        tabBarItem.image?.withTintColor(.purple, renderingMode: .alwaysOriginal)
    }
    
    func addSubviews() {
        view.backgroundColor = .white
        view.addSubview(addButton)
    }
    
    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([

                addButton.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
                addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func addButtonPressed() {}
}
