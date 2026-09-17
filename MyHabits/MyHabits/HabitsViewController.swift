//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Anton Kruglov on 15.09.2026.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private lazy var habitsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: "ProgressCollectionViewCell")
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: "HabitCollectionViewCell")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addSubviews()
        setupNavigationItem()
    }

    func setupView() {
        view.backgroundColor = .systemGroupedBackground
    }
    
    func addSubviews() {
        view.addSubview(habitsCollectionView)
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
