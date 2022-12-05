//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    lazy var superShape: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    lazy var settingsBox: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    //MARK: settings buttons
    
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        view.addSubview(superShape)
        view.addSubview(settingsBox)
        setConstraints()
    }
    
    private func setConstraints() {
        superShape.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            superShape.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            superShape.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            superShape.widthAnchor.constraint(equalToConstant: 200),
            superShape.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        settingsBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingsBox.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            settingsBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingsBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            settingsBox.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -10),
            settingsBox.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
