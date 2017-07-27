//
//  DetailViewControllerTests.swift
//  PatientDetail
//
//  Created by Akhilraj on 27/07/17.
//  Copyright © 2017 QBurst. All rights reserved.
//

import XCTest
@testable import PatientDetail

class DetailViewControllerTests: XCTestCase {
    
    var detailVC = DetailViewController()
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: DetailModule.self)
        let sb = UIStoryboard(name: "DetailStoryboard", bundle: bundle)
        detailVC = sb.instantiateViewController(withIdentifier:
            DetailViewController.identifier) as! DetailViewController
    }
    
    func testDetailLabelContent() {
        let patientID = "1234"
        detailVC.patientID = patientID
        _ = detailVC.view
        let detailContent = detailVC.detailLabel.text
        XCTAssertEqual(detailContent, "Patient ID : \(patientID)")
    }
    
}
