//
//  ViewController.swift
//  Calculator
//
//  Created by Uladzislau Komar on 13.10.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    enum Operators: String {
        case plus = "+"
        case minus = "-"
        case multiply = "*"
        case equal = "="
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonCLick(_ sender: UIButton) {
        guard let buttonText = sender.title(for: .normal) else {
            return
        }
        
        var labelText = self.label.text ?? ""
        labelText += buttonText
        self.label.text = labelText
    }
    
    
}

