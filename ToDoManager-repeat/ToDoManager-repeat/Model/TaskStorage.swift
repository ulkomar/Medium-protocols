//
//  TaskStorage.swift
//  ToDoManager-repeat
//
//  Created by Uladzislau Komar on 2.10.22.
//

import Foundation

protocol TaskStorageProtocol {
    func loadTasks() -> [TaskProtocol]
    func saveTasks(_ tasks:[TaskProtocol])
}

class TaskStorage: TaskStorageProtocol {
    func loadTasks() -> [TaskProtocol] {
        let testTasks: [TaskProtocol] = [ Task(title: "Купить хлеб", status: .planned, type: .normal),
                                          Task(title: "Помыть кота", status: .planned, type: .important),
                                          Task(title: "Отдать долг Арнольду", status: .completed, type: .important),
                                          Task(title: "Купить новый пылесос", status: .completed, type: .normal),
                                          Task(title: "Подарить цветы супруге", status: .planned, type: .important),
                                          Task(title: "Позвонить родителям", status: .planned, type: .important)]
        return testTasks
    }
    
    func saveTasks(_ tasks: [TaskProtocol]) {
        <#code#>
    }
    
    
}
