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
        let addTaskNavigationController = getViewController("AddTaskNavigationController")
        let addTaskViewController = addTaskNavigationController.children[0]
        (addTaskViewController as? AddTaskViewController)?.delegate = self
        navigationController?.present(addTaskNavigationController, animated: true)
    }
    
    func getViewController(_ id: String) -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyBoard.instantiateViewController(withIdentifier: id)
        return viewController
    }
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
        cell.titleLabel.font = UIFont.systemFont(ofSize: 20)
        cell.descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = data.dataSource[indexPath.row]
        let index: Int = indexPath.row
        let detailsNavigationController = getViewController("DetailsNavigationController")
        let viewController = detailsNavigationController.children[0]
        let detailsViewController = (viewController as? DetailsViewController)
        detailsViewController?.delegate = self
        detailsViewController?.task = task
        detailsViewController?.index = index
        navigationController?.present(detailsNavigationController, animated: true)
    }
}

extension MainViewController: AddTaskDelegate {
    
    func addTaskTaped() {
        tableTasks.reloadData()
    }
}

extension MainViewController: TaskDetailsDelegate {
    
    func editButtonTaped() {
        tableTasks.reloadData()
    }
    
    func deleteButtonTaped() {
        tableTasks.reloadData()
    }
}
