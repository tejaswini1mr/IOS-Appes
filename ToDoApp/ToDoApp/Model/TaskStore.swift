//
//  TaskStore.swift
//  ToDoApp
//
//  Created by Tejaswini MR on 25/03/21.
//

import Foundation

class TaskStore {
    var tasks = [[Task](), [Task]()]
    
    func add(_ task: Task, at index: Int, isDone: Bool = false) {
       let section = isDone ? 1 : 0
        tasks[section].insert(task, at: index)
    }
    
    func removeTask(at index: Int, isDone: Bool = false)->Task {
        let section = isDone ? 1 : 0
        return tasks[section].remove(at: index)
    }
}

