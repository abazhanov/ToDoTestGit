//
//  Task.swift
//  ToDoist
//
//  Created by Mac on 15.04.2021.
//

//Модель:
//- название
//- описание
//- дата
//- статус
//-- новая
//-- завершена
import Foundation

struct Task {
    let name: String
    let description: String
    let status: Status
    let importantStatus: ImportantStatus
    
    static func getTasks1() -> [Task] {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let tasks = [
        Task(
            name: "Task_1",
            description: "Des_1",
            status: .undone,
            importantStatus: .low),
        Task(
                name: "Task_2",
                description: "Des_2",
                status: .undone,
            importantStatus: .normal)
            
        ]
        return tasks
    }
    
    
    static func getTasks2() -> [Task] {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let tasks = [
        Task(
            name: "Task_11",
            description: "Des_11",
            status: .undone,
            importantStatus: .low),
        Task(
                name: "Task_22",
                description: "Des_22",
                status: .undone,
            importantStatus: .normal)
            
        ]
        return tasks
    }
    
}

enum Status {
    case done
    case undone
}

enum ImportantStatus {
    case emergency
    case normal
    case low
}
