//
//  Base.swift
//  fxpro
//
//  Created by admin on 19/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class Base {
    var someProp: String {
        var prop: String
        switch self {
        default:
            prop = "default"
        }
        return prop
    }
}
