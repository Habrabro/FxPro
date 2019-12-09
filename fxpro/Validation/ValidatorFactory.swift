//
//  ValidatorCreator.swift
//  fxpro
//
//  Created by admin on 06/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

enum ValidatorType {
    case streetAndNumber
    case postalZipCode
    case cityTown
    case dateOfBirth
}

class ValidatorFactory {
    
    static let DEFAULT_SUCCESS_MESSAGE = "Validated"
    
    static func validatorFor(type: ValidatorType) -> Validator {
        switch type {
        case .streetAndNumber: return RegexValidator(expression: "^\\s*.+\\s*,\\s*\\d+\\s*$", successMessage: DEFAULT_SUCCESS_MESSAGE, failureMessage: "Provide valid street and number")
        case .postalZipCode: return RegexValidator(expression: ".+", successMessage: DEFAULT_SUCCESS_MESSAGE, failureMessage: "Provide a postal / zip code")
        case .cityTown: return RegexValidator(expression: "^\\s*\\p{L}+(?:[\\s-]\\p{L}+)*\\s*$", successMessage: DEFAULT_SUCCESS_MESSAGE, failureMessage: "Provide a valid city or town name")
        case .dateOfBirth: return DateOfBirthValidator()
        }
    }
}
