//
//  MainViewController.swift
//  to-do-list
//
//  Created by Cristian Palomino on 26/05/23.
//

import UIKit
import Foundation

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var titleNavigation: UINavigationItem!
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var tableTasks: UITableView!
    
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
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let datailsViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsNavigationController")
        navigationController?.present(datailsViewController, animated: true)
    }
}
