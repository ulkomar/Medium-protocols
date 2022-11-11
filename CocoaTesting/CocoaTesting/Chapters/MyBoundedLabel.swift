//
//  MyBoundedLabel.swift
//  CocoaTesting
//
//  Created by Uladzislau Komar on 10.11.22.
//

import UIKit

class MyBoundedLabel: UILabel {

    override func drawText(in rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.stroke(self.bounds.insetBy(dx: 1, dy: 1))
        super.drawText(in: rect.insetBy(dx: 5, dy: 5))
    }

}
