//
//  NewTaskViewController.swift
//  ToDoTestGit
//
//  Created by Artem Bazhanov on 18.04.2021.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    var user: User!
    
    var delegate: CreateNewTaskViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func CreatePassed() {
        print("sssssss")
        
        delegate.addTask(task: [Task(
                                    name: "New task",
                                    description: "Des new task",
                                    status: .undone,
                                    importantStatus: .low)])
        
        
        dismiss(animated: true)
    }
}
