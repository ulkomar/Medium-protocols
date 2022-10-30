//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("button", for: .normal)
        button.backgroundColor = .systemBlue
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
