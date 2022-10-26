//
//  RegistractionCoordinator.swift
//  Coordinator_Theory
//
//  Created by Uladzislau Komar on 26.10.22.
//

import Foundation
import UIKit

class RegistrationCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    private var moduleFactory = ModuleFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showNameViewController()
    }
    
    func showNameViewController() {
        let controller = moduleFactory.createNameViewController()
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showLoginViewController() {
        let controller = moduleFactory.createLoginViewController()
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showPassViewController() {
        let controller = moduleFactory.createPassViewController()
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showAgeViewController() {
        let controller = moduleFactory.createAgeViewController()
        navigationController.pushViewController(controller, animated: true)
    }
}
