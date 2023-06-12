//
//  MainViewController.swift
//  to-do-list
//
//  Created by Cristian Palomino on 26/05/23.
//

import UIKit
import Foundation

class EditTaskViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var editTitleLabel: UILabel!
    @IBOutlet weak var inputEditTitle: UITextField!
    @IBOutlet weak var editDescriptionLabel: UILabel!
    @IBOutlet weak var inputEditDescription: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        view.backgroundColor = .gray
    }
}
