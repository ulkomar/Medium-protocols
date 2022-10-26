//
//  FlowController.swift
//  Coordinator_Theory
//
//  Created by Uladzislau Komar on 26.10.22.
//

import Foundation

protocol FlowController {
    associatedtype T
    
    var completionHandler: ((T) -> ())? { get set }
}
