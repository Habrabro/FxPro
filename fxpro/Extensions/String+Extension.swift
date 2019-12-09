//
//  String+Extension.swift
//  fxpro
//
//  Created by admin on 08/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

extension String {
    static func ~= (lhs: String, rhs: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: rhs) else { return false }
        let range = NSRange(location: 0, length: lhs.utf16.count)
        return regex.firstMatch(in: lhs, options: [], range: range) != nil
    }
}
