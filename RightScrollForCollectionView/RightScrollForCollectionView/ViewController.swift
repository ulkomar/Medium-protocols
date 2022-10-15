//
//  ViewController.swift
//  RightScrollForCollectionView
//
//  Created by Uladzislau Komar on 15.10.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    var cellID = "PageCell"
    var data = [
        UIColor.green,
        UIColor.yellow,
        UIColor.brown
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    func setup() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "PageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PageCell")
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
    }

}

//MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    //Return number of items in one section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    //Returns customizable item design
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Check whether a cell exists
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? PageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        //Set color for a cell
        let index = indexPath.item % 3
        let color = data[index]
        cell.backgroundColor = color
        
        return cell
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.bounds.width
        let height: CGFloat = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(0)
    }
    
}
