//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Anton Kruglov on 16.09.2026.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupContentView()
        addSubviews()
        setupConstraints()
        setupActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        onCircleTap = nil
    }

    var onCircleTap: (() -> Void)?

    private lazy var habitNameLabel: UILabel = {
        let habitNameLabel = UILabel()
        habitNameLabel.translatesAutoresizingMaskIntoConstraints = false
        habitNameLabel.font = UIFont.boldSystemFont(ofSize: 21)

        return habitNameLabel
    }()

    private lazy var habitDescriptionLabel: UILabel = {
        let habitDescriptionLabel = UILabel()
        habitDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        habitDescriptionLabel.font = UIFont.systemFont(ofSize: 13)
        habitDescriptionLabel.textColor = .systemGray3

        return habitDescriptionLabel
    }()

    private lazy var habitCounter: UILabel = {
        let habitCounter = UILabel()
        habitCounter.translatesAutoresizingMaskIntoConstraints = false

        habitCounter.font = UIFont.systemFont(ofSize: 14)
        habitCounter.textColor = .systemGray2

        return habitCounter
    }()

    private lazy var colorCircle: UIButton = {
        let colorCircle = UIButton()
        colorCircle.translatesAutoresizingMaskIntoConstraints = false
        colorCircle.clipsToBounds = true
        colorCircle.layer.cornerRadius = 17.5

        return colorCircle
    }()

    func setupContentView() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 5
        contentView.backgroundColor = .white
    }

    func addSubviews() {
        contentView.addSubview(habitNameLabel)
        contentView.addSubview(habitDescriptionLabel)
        contentView.addSubview(habitCounter)
        contentView.addSubview(colorCircle)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            habitNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            habitNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            habitNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: colorCircle.leadingAnchor, constant: -8),

            habitDescriptionLabel.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor, constant: 5),
            habitDescriptionLabel.leadingAnchor.constraint(equalTo: habitNameLabel.leadingAnchor),

            habitCounter.topAnchor.constraint(equalTo: habitDescriptionLabel.bottomAnchor, constant: 8),
            habitCounter.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            habitCounter.leadingAnchor.constraint(equalTo: habitNameLabel.leadingAnchor),

            colorCircle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            colorCircle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            colorCircle.widthAnchor.constraint(equalToConstant: 35),
            colorCircle.heightAnchor.constraint(equalTo: colorCircle.widthAnchor),
        ])
    }

    func setupActions() {
        colorCircle.addTarget(self, action: #selector(circleTapped), for: .touchUpInside)
    }

    func configure(with habit: Habit) {
        habitNameLabel.text = habit.name
        habitNameLabel.textColor = habit.color
        habitDescriptionLabel.text = habit.dateString
        habitCounter.text = "Счетчик: \(habit.trackDates.count)"

        if habit.isAlreadyTakenToday {
            colorCircle.backgroundColor = habit.color
            colorCircle.layer.borderWidth = 0
            colorCircle.setImage(UIImage(systemName: "checkmark"), for: .normal)
            colorCircle.tintColor = .white
        } else {
            colorCircle.backgroundColor = .clear
            colorCircle.layer.borderColor = habit.color.cgColor
            colorCircle.layer.borderWidth = 2
            colorCircle.setImage(nil, for: .normal)
        }
    }

    @objc func circleTapped() {
        onCircleTap?()
    }
}
