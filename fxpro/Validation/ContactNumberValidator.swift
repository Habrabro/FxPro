//
//  PhoneNumberValidator.swift
//  fxpro
//
//  Created by admin on 11/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import PhoneNumberKit

class ContactNumberValidator: Validator {
    
    // MARK: Constants
    
    let SUCCESS_MESSAGE = "Validated"
    let FAILURE_MESSAGE = "Provide a valid contact number"
    
    // MARK: Private properties
    
    private let phoneNumberKit = PhoneNumberKit()
    
    // MARK: Public methods
    
    func validate(_ data: String, completion: (Bool, String) -> ()) {
        if let _ = try? phoneNumberKit.parse(data) {
            completion(true, SUCCESS_MESSAGE)
        } else {
            completion(false, FAILURE_MESSAGE)
        }
    }
    
}
