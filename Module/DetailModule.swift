//
//  DetailModule.swift
//  PatientDetail
//
//  Created by Akhilraj on 27/07/17.
//  Copyright © 2017 QBurst. All rights reserved.
//

import Foundation
import AppModules

public class DetailModule : ModuleType {
    
    private let storyBoard = "DetailStoryboard"
    public var urlSchemes:[String] = ["PatientDetail"]
    
    public init(){
        
    }
    
    public func get(url: URL) -> Any? {
        guard let path = url.host else {
            return "Incorrect url"
        }
        if (path == "patientDetailVC") {
            let (valid, message) = ParameterManager.isExpectedParams(["patientID"], presentIn: url)
            if (!valid) {
                print(message)
                return errorViewController()
            } else {
                ParameterManager.saveParameters(url: url)
                let patientId = ParameterManager.param(for: "patientID")
                return patientDetailsViewController(patientId: patientId!)
            }
        }
        return nil
    }
    
    private func patientDetailsViewController(patientId: String) -> UIViewController {
        let bundle = Bundle(for: DetailModule.self)
        let sb = UIStoryboard(name: storyBoard, bundle: bundle)
        let patientDetailVC = sb.instantiateViewController(withIdentifier:
            DetailViewController.identifier) as! DetailViewController
        patientDetailVC.patientID = patientId
        return patientDetailVC
    }
    
    private func errorViewController() -> UIViewController {
        let bundle = Bundle(for: DetailModule.self)
        let sb = UIStoryboard(name: storyBoard, bundle: bundle)
        let errorVC = sb.instantiateViewController(withIdentifier: ErrorViewController.identifier)
        return errorVC
    }
}
