//
//  Task.swift
//  ToDoManager-repeat
//
//  Created by Uladzislau Komar on 2.10.22.
//

import Foundation

enum TaskPriority {
    case important
    case normal
}

enum TaskStatus {
    case completed
    case planned
}

protocol TaskProtocol{
    var title: String { get set }
    var status: TaskStatus { get set }
    var type: TaskPriority { get set }
}

struct Task: TaskProtocol {
    var title: String
    var status: TaskStatus
    var type: TaskPriority
}
