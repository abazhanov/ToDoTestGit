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

    @IBOutlet weak var tableView: UITableView!
    
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
        tableView.reloadData()
        print("Новые значения массива")
        for user in users {
            print(user.name)
            if user.task != nil {
                for task in user.task! {
                    print(task.name)
                }
            }
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

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users[2].task?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let user = users[2]
        
        content.text = user.task?[indexPath.row].name
        
            //users[2].task[indexPath]
        cell.contentConfiguration = content
        
        return cell
    }
    
    
}
