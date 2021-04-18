//
//  ViewController.swift
//  ToDoTestGit
//
//  Created by Artem Bazhanov on 17.04.2021.
//

import UIKit


protocol CreateNewTaskViewController {
    func addTask(task:[Task])
}

class ViewController: UIViewController {

    var users = User.getUsers()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Вот это добавление нового юзера
        users.append(User(name: "user_3", password: "123"))
        
        // Вот здесь юзеру добавляем задачу
        users[2] = User(
            name: "user_3",
            password: "123",
            task: [
                Task(
                    name: "Task_55",
                    description: "Des_55",
                    status: .undone,
                    importantStatus: .low)
            ]
        )
        
        // Просто для проверки на консоле что у нас в массиве лежит
        for user in users {
            print(user.name)

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newTaskVC = segue.destination as? NewTaskViewController else { return }
        newTaskVC.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Новые значения массива")
        for user in users {
            print(user.name)

        }
    }
    
    
}

extension ViewController: CreateNewTaskViewController {
    func addTask(task: [Task]) {
        print("addTask")
        print(task)
        var a = users[2].task
        a?.append(contentsOf: task)
        print("a")
        print(a)
        print()
        print()
        //append(Task: task)
        
        
        
        users[2] = User(
            name: "user_3",
            password: "123",
            task: a
        )
        
        
        for user in users {
            let currentTask = user.task
            print(currentTask!)
        }
    }
    
    
    
    
}
