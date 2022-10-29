//
//  ViewController.swift
//  PhotoDisplaying
//
//  Created by Uladzislau Komar on 29.10.22.
//

import UIKit

class MyViewController : UIViewController, UICollectionViewDelegate {
    
    var collection: UICollectionView?
    var photos: [UIImageView] = []
    var urls: [String] = []
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .green
        collectionSetup()
        self.view.addSubview( collection ?? UICollectionView() )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let photoCollectionFromInternet = MyNetwork()
        Task {
            do {
                let result = try await photoCollectionFromInternet.structureConcurrencyMethod()
                for item in result {
                    urls.append(item.url)
                }
                let res = try await photoCollectionFromInternet.fetchDownload(photosURL: urls)
                photos = res
                self.collection?.reloadData()
            } catch {
                print("no")
            }
        }
        print("hello")
    }
    
    private func collectionSetup() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        collection = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collection?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        collection?.backgroundColor = UIColor.red
        collection?.dataSource = self
    }
}

extension MyViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let indexPhoto: UIImageView = self.photos[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        cell.backgroundView = indexPhoto
        
        return cell
    }
    
    
}

