//
//  contactNumberTextField.swift
//  fxpro
//
//  Created by admin on 09/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import TweeTextField
import FlagPhoneNumber

class ContactNumberTextField: ValidatableTextField {
    
    private var separateCountryCodeTextField: UITextField?
    private let fpnTextField = FPNTextField()
    
    func setup() {
        fpnTextField.delegate = self
        fpnTextField.setFlag(countryCode: .RU)
        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    private func setSeparateCountryCodeTextField(textField: UITextField) {
        separateCountryCodeTextField = textField
    }
    
    @objc private func editingChanged() {
        fpnTextField.delegate?.textFieldDidChangeSelection?(fpnTextField)
        
    }
}

extension ContactNumberTextField: FPNTextFieldDelegate {
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        if isValid {

       } else {
          // Do something...
       }
    }
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
    }
    
    func fpnDisplayCountryList() {
    }
}
