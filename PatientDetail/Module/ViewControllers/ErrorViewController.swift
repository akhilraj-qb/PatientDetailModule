//
//  ErrorViewController.swift
//  PatientDetail
//
//  Created by Akhilraj on 27/07/17.
//  Copyright © 2017 QBurst. All rights reserved.
//

import Foundation
import UIKit

class ErrorViewController: UIViewController {
    
    static let identifier = "ErrorViewController"
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        self.title = "Error"
        self.errorLabel.text = "Please Log In via MyChart"
    }
}
