//
//  ParameterManager.swift
//  PatientDetailModule
//
//  Created by Akhilraj on 21/07/17.
//  Copyright © 2017 QBurst. All rights reserved.
//

import Foundation

class ParameterManager {
    
    private static var params:[String:String] = [:]
    
    static func isExpectedParams(_ expected:[String], presentIn url: URL) -> (Bool, String) {
        let queryParams = URLComponents(string: url.absoluteString)?.queryItems
        for expectedItem in expected {
            guard let param = queryParams?.filter({$0.name == expectedItem}).first else {
                return(false, "Missing expected parameter - \(expectedItem)")
            }
            if (param.value?.characters.count == 0) {
                return(false, "Missing expected parameter - \(expectedItem)")
            }
        }
        return(true, "")
    }
    
    static func saveParameters(url: URL) {
        if let queryParams = URLComponents(string: url.absoluteString)?.queryItems {
            for item in queryParams {
                params[item.name] = item.value
            }
        }
    }
    
    static func param(for key: String) -> String? {
        guard let value = params[key] else {
            return nil
        }
        return value
    }
}
