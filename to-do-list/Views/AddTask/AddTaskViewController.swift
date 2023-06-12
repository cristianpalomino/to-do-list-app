//
//  MainViewController.swift
//  to-do-list
//
//  Created by Cristian Palomino on 26/05/23.
//

import UIKit
import Foundation

class AddTaskViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var inputTitle: UITextField!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var inputDescription: UITextField!
    @IBOutlet weak var butonAddTask: UIButton!
    
    override func viewDidLoad() {
        butonAddTask.addTarget(self, action: #selector(addTask), for: .touchUpInside)
    }
    
    @objc private func addTask() {
        if let title: String = inputTitle.text , let description: String = inputDescription.text {
            var Task = Task(title: title, description: description)
            print(Task)
        }
    }
}
