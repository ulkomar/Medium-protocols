//
//  ManageViewController.swift
//  DataTransfering-Delegation
//
//  Created by Uladzislau Komar on 1.10.22.
//

import UIKit

class ManageViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    var updatingTextField: String = ""
    
    var delegate: UpdateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateText(text: updatingTextField)
    }
    
    private func updateText(text: String) {
        self.textField.text = text
    }
    
    @IBAction func saveWithDelegatation(_ sender: UIButton) {
        self.delegate?.updateLabel(text: self.textField.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }
}
