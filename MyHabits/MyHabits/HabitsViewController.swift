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

        collectionView.delegate = self
        collectionView.dataSource = self

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addSubviews()
        setupContraints()
        setupNavigationItem()
    }

    func setupView() {
        view.backgroundColor = .systemGroupedBackground
    }

    func addSubviews() {
        view.addSubview(habitsCollectionView)
    }

    func setupContraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            habitsCollectionView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            habitsCollectionView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            habitsCollectionView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            habitsCollectionView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
        ])
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

extension HabitsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return HabitsStore.shared.habits.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let progressCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProgressCollectionViewCell", for: indexPath) as? ProgressCollectionViewCell else {
                fatalError("could not dequeueReusableCell")
            }
            progressCell.configure(progress: HabitsStore.shared.todayProgress)
            return progressCell
        } else {
            guard let habitCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "HabitCollectionViewCell",
                for: indexPath) as? HabitCollectionViewCell else {
                fatalError("could not dequeueReusableCell")
            }
            let habit = HabitsStore.shared.habits[indexPath.item]
            habitCell.configure(with: habit)
            return habitCell
        }
    }
}

extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width - 32
        if indexPath.section == 0 {
            return CGSize(width: itemWidth, height: 60)
        } else {
            return CGSize(width: itemWidth, height: 100)
        }
    }
    
    enum Constants {
        static let progressVerticalSpacing = 20.0
        static let habitVerticalSpacing = 10.0
        static let horizontalSpacing = 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets { if section == 0 {
        UIEdgeInsets(top: Constants.progressVerticalSpacing, left: Constants.horizontalSpacing, bottom: Constants.habitVerticalSpacing, right: Constants.horizontalSpacing)
    } else {
        UIEdgeInsets(top: Constants.habitVerticalSpacing, left: Constants.horizontalSpacing, bottom: Constants.habitVerticalSpacing, right: Constants.horizontalSpacing)
    }
    }
}
