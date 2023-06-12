//
//  MainViewController.swift
//  to-do-list
//
//  Created by Cristian Palomino on 26/05/23.
//

import UIKit
import Foundation

class DetailsViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleDescriptionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        view.backgroundColor = .gray
    }
}
