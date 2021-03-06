//
//  RegexValidator.swift
//  fxpro
//
//  Created by admin on 09/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class RegexValidator: Validator {
    
    // MARK: Private properties
    
    private var expression: String
    private var successMessage: String
    private var failureMessage: String
    
    // MARK: Init
    
    init(expression: String, successMessage: String, failureMessage: String) {
        self.expression = expression
        self.successMessage = successMessage
        self.failureMessage = failureMessage
    }
    
    // MARK: Public methods
    
    func validate(_ data: String, completion: (_ isValid: Bool, _ message: String) -> ()) {
        let regex = NSRegularExpression(expression)
        let isMatching = regex.matches(data)
        
        if isMatching {
            completion(isMatching, successMessage)
        } else {
            completion(isMatching, failureMessage)
        }
    }
}
