//
//  NameViewController.swift
//  Coordinator_Theory
//
//  Created by Uladzislau Komar on 26.10.22.
//

import UIKit

class NameViewController: UIViewController {

    //MARK: UIViews
    private var textField = UITextField()
    private var button = UIButton()
    
    //MARK: Override functions
    override func loadView() {
        super.loadView()
        self.textFieldSetup(view: &self.textField)
        self.buttonSetup(view: &self.button)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(button)
    }

    //MARK: Views setting up
    private func textFieldSetup(view: inout UITextField) {
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 40)
        view.center = self.view.center
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
    }
    
    private func buttonSetup(view: inout UIButton) {
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        view.center.x = self.view.center.x
        view.center.y = self.view.center.y + 80
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemBlue
        view.setTitleColor(.white, for: .normal)
        view.setTitle("Next screen", for: .normal)
        view.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    //MARK: Action functions
    @objc func buttonAction(_ sender: UIButton) {
        // do something
        print("hello")
    }

}
