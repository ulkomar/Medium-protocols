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
    var userData: UserDataProtocol = UserData()
    
    private var moduleFactory = ModuleFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showNameViewController()
    }
    
    func showNameViewController() {
        let controller = moduleFactory.createNameViewController()
        
        controller.completionHandler = { [weak self] value in
            self?.userData.userName = value
            self?.showLoginViewController()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showLoginViewController() {
        let controller = moduleFactory.createLoginViewController()
        
        controller.completionHandler = { [weak self] value in
            self?.userData.login = value
            self?.showPassViewController()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showPassViewController() {
        let controller = moduleFactory.createPassViewController()
        
        controller.completionHandler = { [weak self] value in
            self?.userData.password = value
            self?.showAgeViewController()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showAgeViewController() {
        let controller = moduleFactory.createAgeViewController()
        
        controller.completionHandler = { [weak self] value in
            self?.userData.age = value
        }
        navigationController.pushViewController(controller, animated: true)
        
    }
}
