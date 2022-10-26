//
//  RegistrationFactory.swift
//  Coordinator_Theory
//
//  Created by Uladzislau Komar on 26.10.22.
//

import Foundation
import UIKit

class ModuleFactory {
    func createNameViewController() -> NameViewController {
        return NameViewController()
    }
    
    func createLoginViewController() -> LoginViewController {
        return LoginViewController()
    }
    
    func createPassViewController() -> PassViewController {
        return PassViewController()
    }
    
    func createAgeViewController() -> AgeViewController {
        return AgeViewController()
    }
}
