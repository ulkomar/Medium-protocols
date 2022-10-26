//
//  RegistrationFactory.swift
//  Coordinator_Theory
//
//  Created by Uladzislau Komar on 26.10.22.
//

import Foundation
import UIKit

class ModuleFactory {
    func createNameViewController() -> UIViewController {
        return NameViewController()
    }
    
    func createLoginViewController() -> UIViewController {
        return LoginViewController()
    }
    
    func createPassViewController() -> UIViewController {
        return PassViewController()
    }
    
    func createAgeViewController() -> UIViewController {
        return AgeViewController()
    }
}
