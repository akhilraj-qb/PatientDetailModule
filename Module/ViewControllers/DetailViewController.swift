//
//  DetailViewController.swift
//  PatientDetail
//
//  Created by Akhilraj on 27/07/17.
//  Copyright © 2017 QBurst. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController : UIViewController {
    
    static let identifier = "DetailViewController"
    
    @IBOutlet weak var detailLabel: UILabel!
    
    var patientID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        self.title = "Detail"
        self.detailLabel.text = "Patient ID : \(patientID)"
    }
}
