//
//  Coordinator.swift
//  Coordinator_Theory
//
//  Created by Uladzislau Komar on 26.10.22.
//

import Foundation
import UIKit

typealias CoordinatorHandler = () -> ()

protocol CoordinatorProtocol: AnyObject {
    
    var navigationController: UINavigationController { get set }
    var flowCompletionHandler: CoordinatorHandler? { get set }
    
    func start()
}
