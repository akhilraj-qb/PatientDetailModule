//
//  ViewController.swift
//  PatientDetail
//
//  Created by Akhilraj on 27/07/17.
//  Copyright © 2017 QBurst. All rights reserved.
//

import UIKit
import AppModules
//import PatientDetailModule

class ViewController: UIViewController {

    let moduleConnector = ModuleConnector()
    
    @IBOutlet weak var patientIdField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moduleConnector.mount(module: DetailModule())
    }

    @IBAction func showDetails(_ sender: Any) {
        
        let patient = self.patientIdField.text
        guard let url = URL(string: "PatientDetail://patientDetailVC?patientID=\(patient ?? "")") ,
            let viewController = moduleConnector.get(url: url) as? UIViewController
            else { return }
        
        navigationController?.pushViewController(viewController, animated: true)
    }

}

