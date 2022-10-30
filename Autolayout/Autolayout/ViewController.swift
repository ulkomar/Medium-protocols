//
//  ViewController.swift
//  Autolayout
//
//  Created by Uladzislau Komar on 30.10.22.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let label = UILabel()
        let redBox = UIView()
        redBox.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "upperleft"
        label.backgroundColor = .systemYellow
        redBox.backgroundColor = .red
        
        view.addSubview(label)
        view.addSubview(redBox)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            redBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redBox.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redBox.widthAnchor.constraint(equalToConstant: 88),
            redBox.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    


}

