//
//  NewTaskViewController.swift
//  ToDoTestGit
//
//  Created by Artem Bazhanov on 18.04.2021.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    @IBOutlet weak var nameTaskTF: UITextField!
    @IBOutlet weak var descriptionTaskTF: UITextField!
    
    @IBOutlet weak var status: UISwitch!
    
    @IBOutlet weak var lowImportant: UISwitch!
    @IBOutlet weak var normalImportant: UISwitch!
    @IBOutlet weak var emergencyImportant: UISwitch!
    
    var user: User!
    var statusImportant: ImportantStatus = .low
    
    var delegate: CreateNewTaskViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func CreatePassed() {
        print("sssssss")
        
        delegate.addTask(task: [Task(
                                    name: nameTaskTF.text!,
                                    description: descriptionTaskTF.text!,
                                    status: .undone,
                                    importantStatus: statusImportant)])
        
        
        dismiss(animated: true)
    }
    
    @IBAction func statusSwitched() {
        print(status.isOn)
    }
    
    @IBAction func statusImortant(_ sender: UISwitch) {
        print(sender)
        switch sender {
        case lowImportant:
            if lowImportant.isOn {
                normalImportant.isOn = false
                emergencyImportant.isOn = false
                
                statusImportant = .low
            } else {
                lowImportant.isOn = true
            }
            
        case normalImportant:
            if normalImportant.isOn {
                lowImportant.isOn = false
                emergencyImportant.isOn = false
                
                statusImportant = .normal
            } else {
                normalImportant.isOn = true
            }
            
        default:
            if emergencyImportant.isOn {
                lowImportant.isOn = false
                normalImportant.isOn = false
                
                statusImportant = .emergency
            } else {
                emergencyImportant.isOn = true
            }
        }
    }
    
    
    
    
    
}
