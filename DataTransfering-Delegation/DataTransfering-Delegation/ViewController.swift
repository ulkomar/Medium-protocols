//
//  ViewController.swift
//  DataTransfering-Delegation
//
//  Created by Uladzislau Komar on 1.10.22.
//

import UIKit

class ViewController: UIViewController, UpdateProtocol {

    @IBOutlet var textLabel: UILabel!
    var updatedLabel: String = "Test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateText(text: updatedLabel)
    }
    
    func updateLabel(text: String) {
        self.updatedLabel = text
        self.updateText(text: text)
    }
    
    private func updateText(text: String) {
        self.textLabel.text = text
    }
    
    @IBAction func editDataWithDelegate(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondScreen = storyboard.instantiateViewController(withIdentifier: "manageViewController") as! ManageViewController
        secondScreen.delegate = self
        secondScreen.updatingTextField = textLabel.text ?? ""
        self.navigationController?.pushViewController(secondScreen, animated: true)
    }
}

