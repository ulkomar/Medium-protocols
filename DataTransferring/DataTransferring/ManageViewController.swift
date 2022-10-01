//
//  ManageViewController.swift
//  DataTransferring
//
//  Created by Uladzislau Komar on 1.10.22.
//

import UIKit

class ManageViewController: UIViewController {
    //MARK: Properties
    var updatingLabelText: String = ""
    
    //MARK: IBOutlets
    @IBOutlet var textField: UITextField!
    
    //MARK: Overriding functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateDataWithProperties(text: self.updatingLabelText)
    }
    
    //MARK: Auxiliary functions
    private func updateDataWithProperties(text: String) {
        self.textField.text = text
    }

    //MARK: IBActions
    @IBAction func saveWithProperties(_ sender: UIButton) {
        self.navigationController?.viewControllers.forEach {controller in
            guard let firstController = controller as? ViewController else {
                return
            }
            firstController.updatedLabel = self.textField.text ?? ""
            self.navigationController?.popViewController(animated: true)
        }
    }
}
