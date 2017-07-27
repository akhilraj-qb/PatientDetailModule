//
//  ErrorViewControllerTests.swift
//  PatientDetail
//
//  Created by Akhilraj on 27/07/17.
//  Copyright © 2017 QBurst. All rights reserved.
//

import XCTest
@testable import PatientDetail

class ErrorViewControllerTests: XCTestCase {
    var errorVC = ErrorViewController()
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: DetailModule.self)
        let sb = UIStoryboard(name: "DetailStoryboard", bundle: bundle)
        errorVC = sb.instantiateViewController(withIdentifier: ErrorViewController.identifier) as! ErrorViewController
        _ = errorVC.view
    }
    
    func testErrorLabelContent() {
        let errorContent = errorVC.errorLabel.text
        XCTAssertEqual(errorContent, "Please Log In via MyChart")
    }
    
}
