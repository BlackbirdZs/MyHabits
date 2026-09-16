//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Anton Kruglov on 15.09.2026.
//

import UIKit

class HabitViewController: UIViewController {
    private var habitText = ""

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
        habitTextField.addTarget(self, action: #selector(habitTextChanged(_:)), for: .editingChanged)

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

    private lazy var colorCircle: UIView = {
        let colorCircle = UIView()
        colorCircle.translatesAutoresizingMaskIntoConstraints = false
        colorCircle.layer.cornerRadius = 15
        colorCircle.backgroundColor = .red

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

    private lazy var timePicker: UIDatePicker = {
        let timePicker = UIDatePicker()
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels

        return timePicker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupNavigationItems()
        setupConstraints()
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
        view.addSubview(timePicker)
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

            timePicker.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 16),
            timePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    @objc func habitTextChanged(_ textField: UITextField) {
        habitText = habitTextField.text ?? ""
    }

    @objc func cancelButtonTapped() {
        dismiss(animated: true)
    }

    @objc func saveButtonTapped() {
        dismiss(animated: true)
    }
}
