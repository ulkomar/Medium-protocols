//
//  ViewController.swift
//  NavigationApp
//
//  Created by Uladzislau Komar on 30.09.22.
//

import UIKit

class ViewController: UIViewController {
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func toGreenScene(_ sender: UIButton) {
        let greenScene = storyBoard.instantiateViewController(withIdentifier: "greenViewController")
        self.navigationController?.pushViewController(greenScene, animated: true)
    }
    
    @IBAction func toYellowScene(_ sender: UIButton) {
        let yellowScene = storyBoard.instantiateViewController(withIdentifier: "yellowViewController")
        self.navigationController?.pushViewController(yellowScene, animated: true)
    }
    
    @IBAction func toRootScene(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

