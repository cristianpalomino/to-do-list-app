//
//  MainViewController.swift
//  to-do-list
//
//  Created by Cristian Palomino on 26/05/23.
//

import UIKit
import Foundation

class MainViewController: UIViewController {
    @IBOutlet weak var titleNavi: UINavigationItem!
    @IBOutlet weak var tableTask: UITableView!
    @IBOutlet weak var addTaskButton: UIButton!
    
        override func viewDidLoad() {
        view.backgroundColor = .gray
    }
}
