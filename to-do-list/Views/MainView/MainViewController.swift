//
//  MainViewController.swift
//  to-do-list
//
//  Created by Cristian Palomino on 26/05/23.
//

import UIKit
import Foundation

class MainViewController: UIViewController {

    @IBOutlet weak var titleNavigation: UINavigationItem!
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var tableTasks: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaskButton.addTarget(self, action: #selector(addTaskPresentButton), for: .touchUpInside)
    }
    
    @objc private func addTaskPresentButton() {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let addTaskNavigationController = storyBoard.instantiateViewController(withIdentifier: "AddTaskNavigationController")
        let addTaskViewController = addTaskNavigationController.children[0]
        (addTaskViewController as? AddTaskViewController)?.delegate = self
        navigationController?.present(addTaskNavigationController, animated: true)
    }
}

extension MainViewController: AddTaskDelegate {

    func addTaskTaped() {
        tableTasks.reloadData()
    }
}

extension MainViewController: EditTaskDelegate {
   
    func saveTaskTapped() {
        tableTasks.reloadData()
        print("Recargue todo #editTask")
    }
}

extension MainViewController: TaskDetailsDelegate {

    func foo() { }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! NewTableViewCell
        cell.titleLabel?.text = data.dataSource[indexPath.row].title
        cell.descriptionLabel?.text = data.dataSource[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = data.dataSource[indexPath.row]
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let detailsNavigationController = storyBoard.instantiateViewController(withIdentifier: "DetailsNavigationController")
        let viewController = detailsNavigationController.children[0]
        let detailsViewController = (viewController as? DetailsViewController)
        detailsViewController?.delegate = self
        detailsViewController?.task = task
        navigationController?.present(detailsNavigationController, animated: true)
    }
}
