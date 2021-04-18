//
//  User.swift
//  ToDoist
//
//  Created by Artem Bazhanov on 17.04.2021.
//

import Foundation

struct User {
    var name: String
    var password: String
    var task: [Task]?
    
    static func getUsers() -> [User] {
        [
        User(
            name: "User1",
            password: "Password1",
            task: Task.getTasks1()),
        User(
            name: "User2",
            password: "Password2",
            task: Task.getTasks2())
        ]
    }
}
