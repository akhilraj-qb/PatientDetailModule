//
//  StringExtensions.swift
//  PatientDetailModule
//
//  Created by Akhilraj on 19/07/17.
//  Copyright © 2017 QBurst. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: self)
    }
}
extension String {
    func localizedWithComment(_ comment:String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }
}
extension String {
    func isBlank() -> Bool {
        let trimmed = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return trimmed.isEmpty
    }
}
