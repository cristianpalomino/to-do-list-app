//
//  MainViewController.swift
//  to-do-list
//
//  Created by Cristian Palomino on 26/05/23.
//

import UIKit
import Foundation

protocol EditTaskDelegate: AnyObject {
    func saveTaskTapped()
}

class EditTaskViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var editTitleLabel: UILabel!
    @IBOutlet weak var inputEditTitle: UITextField!
    @IBOutlet weak var editDescriptionLabel: UILabel!
    @IBOutlet weak var inputEditDescription: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    weak var delegate: EditTaskDelegate?
    var task: Task?
    
    override func viewDidLoad() {
        inputEditTitle.text = task?.title
        inputEditDescription.text = task?.description
        saveButton.addTarget(self, action: #selector(saveEdited), for: .touchUpInside)
    }
    
    @objc private func saveEdited() {
        task?.title = inputEditTitle.text!
        task?.description = inputEditDescription.text
        delegate?.saveTaskTapped()
        self.dismiss(animated: true, completion: nil)
    }
}
