//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Anton Kruglov on 15.09.2026.
//

import UIKit

class HabitViewController: UIViewController {

    private lazy var habitNameLabel: UILabel = {
        let habitNameLabel = UILabel()
        habitNameLabel.translatesAutoresizingMaskIntoConstraints = false
        habitNameLabel.text = "НАЗВАНИЕ"
        habitNameLabel.textColor = .black
        habitNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        habitNameLabel.backgroundColor = .white

        return habitNameLabel
    }()

    private lazy var habitTextField: UITextField = {
        let habitTextField = UITextField()
        habitTextField.translatesAutoresizingMaskIntoConstraints = false
        habitTextField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        habitTextField.textColor = .black
        habitTextField.font = UIFont.systemFont(ofSize: 15)
        habitTextField.backgroundColor = .white

        return habitTextField
    }()

    private lazy var colorLabel: UILabel = {
        let colorLabel = UILabel()
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        colorLabel.text = "ЦВЕТ"
        colorLabel.textColor = .black
        colorLabel.font = UIFont.boldSystemFont(ofSize: 14)
        colorLabel.backgroundColor = .white

        return colorLabel
    }()

    private lazy var colorCircle: UIButton = {
        let colorCircle = UIButton()
        colorCircle.translatesAutoresizingMaskIntoConstraints = false
        colorCircle.clipsToBounds = true
        colorCircle.layer.cornerRadius = 15
        colorCircle.backgroundColor = .systemPurple

        return colorCircle
    }()

    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.text = "ВРЕМЯ"
        timeLabel.textColor = .black
        timeLabel.backgroundColor = .white
        timeLabel.font = UIFont.boldSystemFont(ofSize: 14)

        return timeLabel
    }()
    
    private lazy var timeLabelDescription: UILabel = {
        let timeLabelDescription = UILabel()
        timeLabelDescription.translatesAutoresizingMaskIntoConstraints = false
        timeLabelDescription.text = "Каждый день в"
        timeLabelDescription.textColor = .black
        timeLabelDescription.font = UIFont.systemFont(ofSize: 15)
        
        return timeLabelDescription
    }()
    
    private lazy var timeValueLabel: UILabel = {
        let timeValueLabel = UILabel()
        timeValueLabel.translatesAutoresizingMaskIntoConstraints = false
        timeValueLabel.textColor = .systemPurple
        timeValueLabel.font = UIFont.systemFont(ofSize: 15)
        
        return timeValueLabel
    }()

    private lazy var timePicker: UIDatePicker = {
        let timePicker = UIDatePicker()
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels

        return timePicker
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let timeFormatter = DateFormatter()
        timeFormatter.locale = Locale(identifier: "en_US")
        timeFormatter.timeStyle = .short
        
        return timeFormatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupConstraints()
        setupActions()
        setupNavigationItems()
        updateTimeLabel()
    }

    func setupView() {
        view.backgroundColor = .white
    }

    func addSubviews() {
        view.addSubview(habitNameLabel)
        view.addSubview(habitTextField)
        view.addSubview(colorLabel)
        view.addSubview(colorCircle)
        view.addSubview(timeLabel)
        view.addSubview(timeValueLabel)
        view.addSubview(timePicker)
        view.addSubview(timeLabelDescription)
    }

    func setupNavigationItems() {
        navigationItem.title = "Создать"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .systemPurple
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .systemPurple
    }

    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            habitNameLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16),
            habitNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            habitTextField.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor, constant: 8),
            habitTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            colorLabel.topAnchor.constraint(equalTo: habitTextField.bottomAnchor, constant: 16),
            colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            colorCircle.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 6),
            colorCircle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            colorCircle.heightAnchor.constraint(equalToConstant: 30),
            colorCircle.widthAnchor.constraint(equalTo: colorCircle.heightAnchor),

            timeLabel.topAnchor.constraint(equalTo: colorCircle.bottomAnchor, constant: 16),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            timeLabelDescription.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 8),
            timeLabelDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            timeValueLabel.topAnchor.constraint(equalTo: timeLabelDescription.topAnchor),
            timeValueLabel.leadingAnchor.constraint(equalTo: timeLabelDescription.trailingAnchor, constant: 3),

            timePicker.topAnchor.constraint(equalTo: timeLabelDescription.bottomAnchor, constant: 16),
            timePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    private func updateTimeLabel() {
        let timeString = timeFormatter.string(from: timePicker.date)
        timeValueLabel.text = "\(timeString)"
    }
    
    @objc private func changeTime() {
        updateTimeLabel()
    }

    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }

    @objc private func saveButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func colorButtonPressed() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.selectedColor = colorCircle.backgroundColor ?? .systemPurple
        colorPicker.delegate = self
        present(colorPicker, animated: true)
    }
    
    private func setupActions() {
        colorCircle.addTarget(self, action: #selector(colorButtonPressed), for: .touchUpInside)
        timePicker.addTarget(self, action: #selector(changeTime), for: .valueChanged)
    }
}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorCircle.backgroundColor = viewController.selectedColor
    }
}
