//
//  ViewController.swift
//  UICollectionView - theory
//
//  Created by Uladzislau Komar on 15.10.22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Variables and constants
    
    var data = [
        UIColor.green,
        UIColor.yellow,
        UIColor.brown
    ]
    
    let cellID = "PhotoCell"
    let insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    //MARK: - Overriding functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionViewSetup()
    }
    
    //MARK: - Class functions
    
    func collectionViewSetup() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellID)
    }
}

//MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    //Return number of items in one section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count * 5
    }
    
    //Returns customizable item design
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Check whether a cell exists
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        //Set color for a cell
        let index = indexPath.item % 3
        let color = data[index]
        cell.setup(color: color)
        
        return cell
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width / 2 - 15
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
}
