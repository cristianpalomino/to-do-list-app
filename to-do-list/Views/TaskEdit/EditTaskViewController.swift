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
        super.viewDidLoad()
        editTaksDidTapped()
    }
    
    func editTaksDidTapped() {
        inputEditTitle.text = task?.title
        inputEditDescription.text = task?.description
        inputEditTitle.layer.borderWidth = 1.0
        inputEditTitle.layer.borderColor = UIColor.black.cgColor
        inputEditDescription.layer.borderWidth = 1.0
        inputEditDescription.layer.borderColor = UIColor.black.cgColor
        saveButton.addTarget(self, action: #selector(saveEdited), for: .touchUpInside)
    }
    
    @objc private func saveEdited() {
        if let title: String = inputEditTitle.text , !title.isEmpty , let description: String = inputEditDescription.text{
            task?.title = title
            task?.description = description
            delegate?.saveTaskTapped()
            self.dismiss(animated: true, completion: nil)
        }else {
            setTitle()
        }
    }
    
    func setTitle() {
        let alert = UIAlertController(title: "Wait", message: "Put A Title", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
