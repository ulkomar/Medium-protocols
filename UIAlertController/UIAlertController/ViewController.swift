//
//  ViewController.swift
//  UIAlertController
//
//  Created by Uladzislau Komar on 30.09.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addActionButton()
    }

    private func addActionButton() {
        let button = UIButton(frame: CGRect(x: 200, y: 30, width: 100, height: 30))
        button.center = self.view.center
        button.layer.cornerRadius = 10
        button.setTitle("Action", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(doAction), for: .touchUpInside)

        self.view.addSubview(button)
    }
    
    @objc private func doAction(_ sender: UIButton) {
        print(sender.tag)
        let alertAction = UIAlertController(title: "New AlertController", message: "Message text", preferredStyle: .alert)
        alertAction.addTextField() {textField in
            textField.placeholder = "Text"
        }
        alertAction.addAction(UIAlertAction(title: "Okay", style: .default))
        alertAction.addAction(UIAlertAction(title: "No", style: .default) {_ in print(alertAction.textFields?[0].text ?? "")})
        
        self.present(alertAction, animated: true)
        
    }
}

