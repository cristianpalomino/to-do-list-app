//
//  MainViewController.swift
//  to-do-list
//
//  Created by Cristian Palomino on 26/05/23.
//

import UIKit
import Foundation

protocol TaskDetailsDelegate: AnyObject {
    func foo()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsNavigationTitle.title = task?.title
        titleLabel.text = task?.title
        descriptionTextView.text = task?.description
        editButton.addTarget(self, action: #selector(editTaskPushButton), for: .touchUpInside)
    }
    
    @objc private func editTaskPushButton() {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let editTaskNavigationController = storyBoard.instantiateViewController(withIdentifier: "EditTaskNavigationController")
        let viewController = editTaskNavigationController.children[0]
        let editTaskViewController = (viewController as? EditTaskViewController)
        editTaskViewController?.delegate = self
        editTaskViewController?.task = task
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension DetailsViewController: EditTaskDelegate {
    func saveTaskTapped() { }
}
 
