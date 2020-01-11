//
//  contactNumberTextField.swift
//  fxpro
//
//  Created by admin on 09/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import TweeTextField
import PhoneNumberKit

class ContactNumberTextField: ValidatableTextField {
    
    // MARK: Constants
    
    let COUNTRY_OF_RESIDENCE_CODE = "RU"
    
    // MARK: Private properties
    
    private let phoneNumberTextField = CustomPhoneNumberTextField()
    private let phoneNumberKit = PhoneNumberKit()
    
    private var prefilledPhoneCode: String? {
        guard let phoneCode = phoneNumberKit.countryCode(for: COUNTRY_OF_RESIDENCE_CODE) else { return nil }
        return "+" + String(phoneCode)
    }
    
    // MARK: Init
    
    override init(frame aFrame: CGRect) {
        super.init(frame: aFrame)
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        text = prefilledPhoneCode
        setCountry(for: COUNTRY_OF_RESIDENCE_CODE)
    }
    
    // MARK: Private methods
    
    private func setCountry(for: String) {
        phoneNumberTextField.setDefaultRegion(to: COUNTRY_OF_RESIDENCE_CODE)
        phoneNumberTextField.withFlag = true
        guard let titleLabel = phoneNumberTextField.flagButton.titleLabel else { return }
        leftView = titleLabel
        leftViewMode = .always
                
    }
    
    private func checkForPlusSymbol() {
        if text!.count == 1, text! != "+" {
            text! = "+" + text!
        }
    }
    
    @objc private func editingChanged() {
        guard let text = self.text else { return }
        phoneNumberTextField.text = text
        self.text = phoneNumberTextField.text
        phoneNumberTextField.updateFlag()
        checkForPlusSymbol()
    }
}
