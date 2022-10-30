//
//  ViewController.swift
//  Autolayout
//
//  Created by Uladzislau Komar on 30.10.22.
//

import UIKit

class ViewController: UIViewController {

    private func makeLabel(_ str: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        label.text = str
        return label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label1 = makeLabel("hello")
        let label2 = makeLabel("Dabid")
        let label3 = makeLabel("Uladzislau Komar")
        let label4 = makeLabel("New text")
        let label5 = makeLabel("Box")
        let label6 = makeLabel("Personal trainee")
        let label7 = makeLabel("New iOS developer")
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 9
        stackView.alignment = .center
        
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(label3)
        stackView.addArrangedSubview(label4)
        stackView.addArrangedSubview(label5)
        stackView.addArrangedSubview(label6)
        stackView.addArrangedSubview(label7)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
//        let nameLabel = UILabel()
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel.backgroundColor = .systemYellow
//        nameLabel.text = "Name"
//
//        let nameTextField = UITextField()
//        nameTextField.translatesAutoresizingMaskIntoConstraints = false
//        nameTextField.backgroundColor = .systemBlue
//        nameTextField.placeholder = "Enter name"
//
//        view.addSubview(nameLabel)
//        view.addSubview(nameTextField)
//
//        NSLayoutConstraint.activate([
//            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
//            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
//            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
//            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
//            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
//        ])
//
//        nameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
//        nameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)

        //        let label = UILabel()
//        let redBox = UIView()
//        redBox.translatesAutoresizingMaskIntoConstraints = false
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "upperleft"
//        label.backgroundColor = .systemYellow
//        redBox.backgroundColor = .red
//
//        view.addSubview(label)
//        view.addSubview(redBox)
//
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//        ])
//
//        NSLayoutConstraint.activate([
//            redBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            redBox.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            redBox.widthAnchor.constraint(equalToConstant: 88),
//            redBox.heightAnchor.constraint(equalToConstant: 90)
//        ])
    }
}

