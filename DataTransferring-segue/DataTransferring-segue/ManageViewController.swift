//
//  ManageViewController.swift
//  DataTransferring-segue
//
//  Created by Uladzislau Komar on 1.10.22.
//

import UIKit

class ManageViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    var updatingText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateChangingText(text: self.updatingText)
    }

    private func updateChangingText(text: String) {
        self.textField.text = text
    }

}
