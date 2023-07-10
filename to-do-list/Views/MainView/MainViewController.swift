//
//  MainViewController.swift
//  to-do-list
//
//  Created by Cristian Palomino on 26/05/23.
//

import UIKit
import Foundation

class MainViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{
    @IBOutlet weak var titleNavi: UINavigationItem!
    @IBOutlet weak var tableTask: UITableView!
    @IBOutlet weak var addTaskButton: UIButton!
    
        override func viewDidLoad() {}
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
    return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! NewTableViewCell
        cell.titleLabel?.text = data.dataSource[indexPath.row].title
        return cell
    }
    
}
