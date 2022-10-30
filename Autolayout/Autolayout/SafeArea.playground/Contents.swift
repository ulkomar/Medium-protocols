//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white

        let redView = UIView()
        redView.backgroundColor = .systemYellow
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            redView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            redView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        view.addSubview(redView)

    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
