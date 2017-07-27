//
//  DetailModuleTests.swift
//  PatientDetail
//
//  Created by Akhilraj on 27/07/17.
//  Copyright © 2017 QBurst. All rights reserved.
//

import XCTest
@testable import PatientDetail

class DetailModuleTests: XCTestCase {
    
    func testModuleScheme() {
        let module = DetailModule()
        XCTAssertGreaterThan(module.urlSchemes.count, 0, "There should be atleast one scheme for this module")
        let schemeName = module.urlSchemes[0]
        XCTAssertFalse(schemeName.isBlank(), "Scheme name should not be empty/blank")
        XCTAssertEqual("PatientDetail", schemeName, "Scheme name of the module should be 'PatientDetail'")
    }
    
    func testModuleGetValidation() {
        let module = DetailModule()
        guard let incompleteUrl = URL(string: "PatientDetail://") else {
            XCTFail()
            return
        }
        guard let error = module.get(url: incompleteUrl) as? String else {
            XCTFail()
            return
        }
        XCTAssertEqual(error, "Incorrect url", "Should return proper error for incorrect url")
        
        guard let incorrectUrl = URL(string: "PatientDetail://abc") else {
            XCTFail()
            return
        }
        XCTAssertNil(module.get(url: incorrectUrl), "Should return nil for unhandled url")
        
        guard let url = URL(string: "PatientDetail://patientDetailVC") else {
            XCTFail()
            return
        }
        XCTAssertNotNil(module.get(url: url), "Should return value for correct url")
    }
    
    func testModuleGetForErrorViewController() {
        let module = DetailModule()
        guard let url = URL(string: "PatientDetail://patientDetailVC") else {
            XCTFail()
            return
        }
        guard let vc = module.get(url: url) else {
            XCTFail()
            return
        }
        XCTAssertNotNil(vc, "Should return view controller for patientDetailVC URL")
        XCTAssertTrue(vc is ErrorViewController, "module should return ErrorViewController if url doesn't have patient id")
    }
    
    func testModuleGetFordetailViewController() {
        let module = DetailModule()
        guard let url = URL(string: "PatientDetail://patientDetailVC?patientID=1234") else {
            XCTFail()
            return
        }
        guard let vc = module.get(url: url) else {
            XCTFail()
            return
        }
        XCTAssertNotNil(vc, "Should return view controller for patientDetailVC URL")
        XCTAssertTrue(vc is DetailViewController, "module should return PatientDetailViewController for correct url")
    }
    
}
