//
//  PhotoCollectionViewCell.swift
//  UICollectionView - theory
//
//  Created by Uladzislau Komar on 15.10.22.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()        
    }

    func setup(color: UIColor) {
        backgroundColor = color
        
    }
}
