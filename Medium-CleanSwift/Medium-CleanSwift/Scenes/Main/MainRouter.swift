import UIKit

@objc protocol MainRoutingLogic {
    func routeToDetailedViewController()
}

protocol MainDataPassing {
    var dataStore: MainDataStore? { get }
}

class MainRouter: NSObject, MainRoutingLogic, MainDataPassing {
    
    weak var viewController: MainViewController?
    var dataStore: MainDataStore?
    
    // MARK: Routing
    
    func routeToDetailedViewController() {
        // получаем конечный Вью Контроллер, куда нам необходимо переходить
        let destinationVC = DetailedViewController()
        
        // получаем хранилище данных
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
        navigateToSomewhere(source: viewController!, destination: destinationVC)
        
        // PS - никогда не используйте force unwrap!
        // здесь он используется для облегчеия моей работы :)
    }
    
    // MARK: Navigation
    
    func navigateToSomewhere(
        source: MainViewController,
        destination: DetailedViewController) {
            // настраиваем переход
            source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToSomewhere(
        source: MainDataStore,
        destination: inout DetailedDataStore) {
            // передаем данные в другой интерактор из нашего
            destination.character = source.chosenCharacter
    }
}
