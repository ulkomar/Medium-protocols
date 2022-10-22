//
//  ViewController.swift
//  UIWIndow
//
//  Created by Uladzislau Komar on 17.10.22.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    private func setupView() {
        self.view = rootView()
        let black = getBlackView()
        
        self.view.addSubview( black )
    }
    
    private func rootView() -> UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    private func getBlackView() -> UIView {
        let viewFrame = CGRect(x: 50, y: 50, width: 300, height: 300)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .black
        return view
    }
  

}

