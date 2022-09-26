//
//  ViewController.swift
//  UserDefaults
//
//  Created by Uladzislau Komar on 26.09.22.
//

import UIKit

class ViewController: UIViewController {

    var userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        self.readData()
    }
    
    private func loadData() {
        let dict1 = ["one": 1, "two": 2, "three": 3]
        let dict2 = ["one": 1, "two": 2, "three": 3]
        let sumDicts = [dict1, dict2]
        userDefaults.set(sumDicts, forKey: "Test")
    }
    
    private func readData() {
        let readArray = userDefaults.object(forKey: "Test") as? [[String: Int]] ?? []
        print(readArray)
    }
}



