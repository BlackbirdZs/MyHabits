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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        isHidden = false
        isSelected = false
        isHighlighted = false
    }

    private lazy var habitNameLabel: UILabel = {
        let habitNameLabel = UILabel()
        habitNameLabel.translatesAutoresizingMaskIntoConstraints = false
        habitNameLabel.font = UIFont.boldSystemFont(ofSize: 20)

        return habitNameLabel
    }()

    private lazy var habitDescriptionLabel: UILabel = {
        let habitDescriptionLabel = UILabel()
        habitDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        habitDescriptionLabel.font = UIFont.systemFont(ofSize: 10)
        habitDescriptionLabel.textColor = .systemGray4

        return habitDescriptionLabel
    }()

    private lazy var habitCounter: UILabel = {
        let habitCounter = UILabel()
        habitCounter.translatesAutoresizingMaskIntoConstraints = false

        habitCounter.font = UIFont.systemFont(ofSize: 13)
        habitCounter.textColor = .systemGray4

        return habitCounter
    }()

    private lazy var colorCircle: UIView = {
        let colorCircle = UIView()
        colorCircle.translatesAutoresizingMaskIntoConstraints = false
        colorCircle.layer.cornerRadius = 20
        colorCircle.backgroundColor = .red
        
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

            habitCounter.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            habitCounter.leadingAnchor.constraint(equalTo: habitNameLabel.leadingAnchor),

            colorCircle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            colorCircle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            colorCircle.widthAnchor.constraint(equalToConstant: 40),
            colorCircle.heightAnchor.constraint(equalTo: colorCircle.widthAnchor),
        ])
    }
    
    @objc func cellTapped() {}
    
    @objc func colorCircleTapped() {} 
    
}
