//
//  ViewController.swift
//  DataTransferring
//
//  Created by Uladzislau Komar on 1.10.22.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    var updatedLabel: String = "Testing"
    
    //MARK: IBOutlets
    @IBOutlet var textLabel: UILabel!
    
    //MARK: Overriding functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updatePropertyLabel(text: updatedLabel)
    }
    
    //MARK: Auxiliary functions
    private func updatePropertyLabel(text: String) {
        self.textLabel.text = self.updatedLabel
    }

    //MARK: IBActions
    @IBAction func editDataWithProperties(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let manageScreen = storyBoard.instantiateViewController(withIdentifier: "manageViewController") as! ManageViewController
        manageScreen.updatingLabelText = textLabel.text ?? ""
        
        self.navigationController?.pushViewController(manageScreen, animated: true)
    }
}

