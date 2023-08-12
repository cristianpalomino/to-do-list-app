//
//  MainViewController.swift
//  to-do-list
//
//  Created by Cristian Palomino on 26/05/23.
//

import UIKit
import Foundation

protocol AddTaskDelegate: AnyObject {
    func addTaskTaped()
}

class AddTaskViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var inputTitle: UITextField!
    @IBOutlet weak var inputDescription: UITextView!
    @IBOutlet weak var butonAddTask: UIButton!
    weak var delegate: AddTaskDelegate?
    
    override func viewDidLoad() {
        addTaskButtonDidTapped()
    }
    
    func addTaskButtonDidTapped() {
        inputTitle.layer.borderWidth = 1.0
        inputTitle.layer.borderColor = UIColor.black.cgColor
        inputDescription.layer.borderWidth = 1.0
        inputDescription.layer.borderColor = UIColor.black.cgColor
        butonAddTask.addTarget(self, action: #selector(addTask), for: .touchUpInside)
    }
    
    @objc private func addTask() {
        if let title: String = inputTitle.text, !title.isEmpty , let description: String = inputDescription.text {
            let task = Task(title: title, description: description)
            data.addTask(task: task)
            delegate?.addTaskTaped()
            self.dismiss(animated: true, completion: nil)
        } else {
            put_a_title()
        }
    }
    
    func put_a_title() {
        let alert = UIAlertController(title: "Wait", message: "Put A Title", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

