//
//  MainViewController.swift
//  to-do-list
//
//  Created by Cristian Palomino on 26/05/23.
//

import UIKit
import Foundation

class AddTaskViewController: UIViewController {
    @IBOutlet weak var inputTitle: UITextField!
    @IBOutlet weak var inputDescription: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        view.backgroundColor = .gray
    }
}
