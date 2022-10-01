//
//  ViewController.swift
//  DataTransferring-segue
//
//  Created by Uladzislau Komar on 1.10.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textLabel: UILabel!
    var updatedText: String = "Test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeTextLabel(text: self.updatedText)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toManageView":
            prepareEditScreen(segue)
        default:
            break
        }
    }

    private func prepareEditScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? ManageViewController else {
            return
        }
        
        destinationController.updatingText = self.textLabel.text ?? ""
    }
    private func changeTextLabel(text: String) {
        self.textLabel.text = text
    }
}

