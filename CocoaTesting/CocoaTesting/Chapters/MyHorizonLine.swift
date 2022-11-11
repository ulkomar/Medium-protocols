//
//  MyHorizonLine.swift
//  CocoaTesting
//
//  Created by Uladzislau Komar on 10.11.22.
//

import UIKit

class MyHorizonLine: UIView {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        let c = UIGraphicsGetCurrentContext()!
        c.move(to: CGPoint(x: 0, y: 0))
        c.addLine(to: CGPoint(x: self.bounds.size.width, y: 0))
        c.strokePath()
    }

}
