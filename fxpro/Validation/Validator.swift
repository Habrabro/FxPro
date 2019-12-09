//
//  Validator.swift
//  fxpro
//
//  Created by admin on 06/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

protocol Validator {
    
    func validate(_ data: String, completion: (_ isValid: Bool, _ message: String) -> ())
}
