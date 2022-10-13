//
//  ViewController.swift
//  Calculator
//
//  Created by Uladzislau Komar on 13.10.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    private var leftOperand: Int?
    private var rightOperand: Int?
    private var Operator: Operators?
    
    enum Operators: String {
        case plus = "+"
        case minus = "-"
        case multiply = "*"
        case equal = "="
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = ""
    }

    @IBAction func buttonClick(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else {
            return
        }
        var labelText = self.label.text ?? ""
        labelText += buttonText
        self.label.text = labelText
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
       guard let operationText = sender.titleLabel?.text,
             let operation = Operators(rawValue: operationText) else {
           return
       }
        
        if case .equal = operation,
            let leftOperand = leftOperand,
           let existingOperation = self.Operator,
           let rightOperandText = self.label.text,
           let rightOperand = Int(rightOperandText) {
            performOperation(operation, lft: leftOperand, rgt: rightOperand)
        }
        
        guard let leftOperandText = label.text,
              let leftOperand = Int(leftOperandText) else {
            return
        }
        
        self.leftOperand = leftOperand
        self.Operator = operation
        label.text = nil
    }
    
    private func performOperation(_ operation: Operators, lft: Int, rgt: Int) {
        var result: Int = 0
        
        switch operation {
        case .plus:
            result = lft + rgt
        case .minus:
            result = lft - rgt
        case .multiply:
            result = lft * rgt
        default:
            break
        }
        print(result)
        label.text = String(result)
    }
}

