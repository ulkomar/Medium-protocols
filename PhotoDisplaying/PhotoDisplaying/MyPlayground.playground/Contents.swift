//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController, UICollectionViewDelegate {
    
    var collection: UICollectionView?
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        collectionSetup()
        
        self.view = view
        self.view.addSubview( collection ?? UICollectionView() )
    }
    
    private func collectionSetup() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        self.collection = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collection?.register(UICollectionView.self, forCellWithReuseIdentifier: "MyCell")
        collection?.backgroundColor = UIColor.gray
        collection?.dataSource = self
    }
}

extension MyViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }
    
    
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
