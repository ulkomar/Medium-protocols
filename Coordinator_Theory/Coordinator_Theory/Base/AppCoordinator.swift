//
//  AppCoordinator.swift
//  Coordinator_Theory
//
//  Created by Uladzislau Komar on 28.10.22.
//

import Foundation
import UIKit

class AppCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    private var childCoordinators: [CoordinatorProtocol] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = UINavigationController()
    }
    
    func start() {
        showRegistrationFlow()
    }
    
    private func showRegistrationFlow() {
        let registrationCoordinator = CoordinatorFactory().createRegistrationCoordinator(navigationController: navigationController)
        childCoordinators.append(registrationCoordinator)
        registrationCoordinator.start()
    }
    
    private func showMainFlow() {
        
    }
}
