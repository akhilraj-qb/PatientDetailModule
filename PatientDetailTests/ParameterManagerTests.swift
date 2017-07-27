//
//  ParameterManagerTests.swift
//  PatientDetailModule
//
//  Created by Akhilraj on 21/07/17.
//  Copyright © 2017 QBurst. All rights reserved.
//

import XCTest
@testable import PatientDetail

class ParameterManagerTests: XCTestCase {
    
    func testExpectedParamSuccess() {
        guard let url = URL(string: "PatientDetail://patientDetailVC?patientID=1234&accessToken=adas22&username=leadership01") else {
            XCTFail()
            return
        }
        
        let expectedParams = ["accessToken", "username", "patientID"]
        let (isPresent, error) = ParameterManager.isExpectedParams(expectedParams, presentIn: url)
        XCTAssertTrue(isPresent)
        XCTAssertEqual("", error)
    }
    
    func testExpectedParamsFailure() {
        guard let url = URL(string: "PatientDetail://patientDetailVC?patientID=1234&accessToken=adas22") else {
            XCTFail()
            return
        }
        
        let expectedParams = ["accessToken", "username", "patientID"]
        let (isPresent, error) = ParameterManager.isExpectedParams(expectedParams, presentIn: url)
        XCTAssertFalse(isPresent)
        XCTAssertEqual("Missing expected parameter - username", error)
    }
    
    func testExpectedParamsFailureForEmptyValue() {
        guard let url = URL(string: "PatientDetail://patientDetailVC?patientID=1234&accessToken=adas22&username=") else {
            XCTFail()
            return
        }
        
        let expectedParams = ["accessToken", "username", "patientID"]
        let (isPresent, error) = ParameterManager.isExpectedParams(expectedParams, presentIn: url)
        XCTAssertFalse(isPresent)
        XCTAssertEqual("Missing expected parameter - username", error)
    }
    
    func testSaveParams() {
        guard let url = URL(string: "PatientDetail://patientDetailVC?patientID=1234&accessToken=adas22&username=leadership01") else {
            XCTFail()
            return
        }
        
        ParameterManager.saveParameters(url: url)
        let patientId = ParameterManager.param(for: "patientID")
        let accessToken = ParameterManager.param(for: "accessToken")
        let username = ParameterManager.param(for: "username")
        let unexpected = ParameterManager.param(for: "Test")
        XCTAssertEqual(patientId, "1234")
        XCTAssertEqual(accessToken, "adas22")
        XCTAssertEqual(username, "leadership01")
        XCTAssertNil(unexpected)
    }
}
