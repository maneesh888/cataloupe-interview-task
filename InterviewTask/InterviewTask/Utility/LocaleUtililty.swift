//
//  LocaleUtililty.swift
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

import Foundation

struct LocaleUtililty {
    static func countryName(countryCode: String) -> String? {
        let current = Locale(identifier: "en_US")
        return current.localizedString(forRegionCode: countryCode)
    }
}
