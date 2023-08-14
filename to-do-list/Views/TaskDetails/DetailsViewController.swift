//
//  MainViewController.swift
//  to-do-list
//
//  Created by Cristian Palomino on 26/05/23.
//

import UIKit
import Foundation

protocol TaskDetailsDelegate: AnyObject {
    func editButtonTaped()
    func deleteButtonTaped()
}

class DetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleDescriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var detailsNavigationTitle: UINavigationItem!
    weak var delegate: TaskDetailsDelegate?
    var task: Task?
    var index: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        detailsButtonDidTapped()
    }

    @objc private func editTaskPushButton() {
        let editTaskNavigationController = getViewController("EditTaskNavigationController")
        let viewController = editTaskNavigationController.children[0]
        let editTaskViewController = (viewController as? EditTaskViewController)
        editTaskViewController?.delegate = self
        editTaskViewController?.task = task
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc private func deleteTaskPushButton() {
        if let index = index {
            data.delete(index: index)
        }
        delegate?.deleteButtonTaped()
        self.dismiss(animated: true, completion: nil)
    }

    func getViewController(_ id: String) -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyBoard.instantiateViewController(withIdentifier: id)
        return viewController
    }
    
    func detailsButtonDidTapped() {
        detailsNavigationTitle.title = "Task Details"
        titleLabel.text = task?.title
        descriptionTextView.text = task?.description
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.borderColor = UIColor.black.cgColor
        editButton.addTarget(self, action: #selector(editTaskPushButton), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteTaskPushButton), for: .touchUpInside)
    }
}

extension DetailsViewController: EditTaskDelegate {

    func saveTaskTapped() {
        delegate?.editButtonTaped()
    }
}

