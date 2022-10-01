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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toMainView":
            goToFirstScreen(segue)
        default:
            break
        }
        
    }
    
    private func goToFirstScreen(_ segue: UIStoryboardSegue) {
        guard let viewController = segue.destination as? ViewController else {
            return
        }
        viewController.updatedText = textField.text ?? ""
    }

    private func updateChangingText(text: String) {
        self.textField.text = text
    }
    


}
