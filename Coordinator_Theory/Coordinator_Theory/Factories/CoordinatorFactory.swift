//
//  CoordinatorFactory.swift
//  Coordinator_Theory
//
//  Created by Uladzislau Komar on 26.10.22.
//

import Foundation
import UIKit

class CoordinatorFactory {
    func createRegistrationCoordinator(navigationController: UINavigationController) -> RegistrationCoordinator {
        return RegistrationCoordinator(navigationController: navigationController)
    }
    
    func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
        return AppCoordinator(navigationController: navigationController)
    }
}
