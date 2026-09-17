//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Anton Kruglov on 16.09.2026.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupContentView()
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "Все получится!"
        textLabel.textColor = .systemGray2
        textLabel.font = UIFont.boldSystemFont(ofSize: 13)

        return textLabel
    }()

    private lazy var progressLabel: UILabel = {
        let progressLabel = UILabel()
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.textColor = .systemGray2
        progressLabel.font = UIFont.boldSystemFont(ofSize: 13)

        return progressLabel
    }()

    private lazy var progressLine: UIProgressView = {
        let progressLine = UIProgressView()
        progressLine.translatesAutoresizingMaskIntoConstraints = false
        progressLine.progressTintColor = .systemPurple
        progressLine.trackTintColor = .systemGray4

        return progressLine
    }()

    private func setupContentView() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
    }

   private func addSubviews() {
        contentView.addSubview(textLabel)
        contentView.addSubview(progressLabel)
        contentView.addSubview(progressLine)
    }

    func configure(progress: Float) {
        progressLine.progress = progress
        progressLabel.text = "\(Int(progress * 100))%"
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            progressLabel.topAnchor.constraint(equalTo: textLabel.topAnchor),
            progressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            progressLine.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 5),
            progressLine.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor),
            progressLine.trailingAnchor.constraint(equalTo: progressLabel.trailingAnchor),
        ])
    }
}
