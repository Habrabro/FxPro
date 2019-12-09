//
//  DateOfBirthValidator.swift
//  fxpro
//
//  Created by admin on 09/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class DateOfBirthValidator: Validator {
    
    // MARK: Constants
    
    let PATTERN = "MM.dd.yyyy"
    let SUCCESS_MESSAGE = "Validated"
    let INVALID_DATE_FORMAT_MESSAGE = "Provide a valid format of date"
    let FUTURE_DATE_MESSAGE = "You could not be born in the future"
    
    // MARK: Public methods
    
    func validate(_ data: String, completion: (Bool, String) -> ()) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = PATTERN
        
        guard let enteredDate = dateFormatter.date(from: data) else {
            completion(false, INVALID_DATE_FORMAT_MESSAGE)
            return
        }
        
        if enteredDate < currentDate {
            completion(true, SUCCESS_MESSAGE)
        } else {
            completion(false, FUTURE_DATE_MESSAGE)
        }
    }
}
