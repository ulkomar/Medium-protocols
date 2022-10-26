//
//  FlowController.swift
//  Coordinator_Theory
//
//  Created by Uladzislau Komar on 26.10.22.
//

import Foundation

protocol FlowControllerProtocol {
    associatedtype T
    
    var completionHandler: ((T) -> ())? { get set }
}
