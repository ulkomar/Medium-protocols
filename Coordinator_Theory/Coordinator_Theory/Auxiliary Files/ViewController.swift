//
//  ViewController.swift
//  Coordinator_Theory
//
//  Created by Uladzislau Komar on 25.10.22.
//

import UIKit

class ViewController: UIViewController {

    private var textField: UITextField!
    private var button: UIButton!
    
    
    override func loadView() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK Settingup view
    private func textFieldSetup(view: inout UITextField) {
        view.center = self.view.center
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        view.layer.cornerRadius = 10
    }
}

