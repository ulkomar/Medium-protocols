//
//  ViewController.swift
//  UIWIndow
//
//  Created by Uladzislau Komar on 17.10.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    private func setupView() {
        self.view = rootView()
        let green = greenView()
        let button = addButtonForAnotherScreen()
        
        self.view.addSubview( green )
        green.addSubview( button )
    }
    
    private func rootView() -> UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    private func greenView() -> UIView {
        let viewFrame = CGRect(x: 50, y: 50, width: 150, height: 300)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .green
        return view
    }
    
    private func addButtonForAnotherScreen() -> UIButton {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Hello world", for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        return button
    }
    
    @objc private func nextScreen(_ sender: UIButton) {
        let rootVC = SecondViewController()
        rootVC.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: nil, action: nil)
        let navVC = UINavigationController(rootViewController: rootVC)
        self.present(navVC, animated: true)
        
    }

}

