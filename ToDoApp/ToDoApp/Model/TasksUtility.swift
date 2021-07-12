//
//  TasksUtility.swift
//  ToDoApp
//
//  Created by Tejaswini MR on 25/03/21.
//

import Foundation

class TasksUtility {
    
    private static let key = "tasks"
    // archive
    private static func archive(_ tasks: [[Task]]) -> NSData {
        return NSKeyedArchiver.archivedData(withRootObject: tasks) as NSData
    }
    // fetch
    static func fetch() -> [[Task]]? {
        guard let unarchivedData = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
        return NSKeyedUnarchiver.unarchiveObject(with: unarchivedData) as? [[Task]]
    }
    // save
    static func save(_ tasks: [[Task]]) {
        // archive
        let archivedTasks = archive(tasks)
        // set object for key
        UserDefaults.standard.set(archivedTasks, forKey: key)
        UserDefaults.standard.synchronize()
    }
}
