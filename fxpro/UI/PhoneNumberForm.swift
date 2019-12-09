//
//  PhoneNumberForm.swift
//  fxpro
//
//  Created by admin on 08/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import TweeTextField

class PhoneNumberForm {
    
    @IBOutlet weak var countryCodeTextField: TweeAttributedTextField?
    @IBOutlet weak var phoneNumberTextField: TweeAttributedTextField?
    
    init(_ vc: ViewController, _ countryCodeTextField: TweeAttributedTextField, _ phoneNumberTextField: TweeAttributedTextField) {
        self.countryCodeTextField = countryCodeTextField
        self.phoneNumberTextField = phoneNumberTextField
        
        vc.countryCodeTextField.addTarget(self, action: #selector(edit), for: .editingDidBegin)
    }
    
    @objc private func edit(_ sender: Any) {
        print("editing")
    }
}
