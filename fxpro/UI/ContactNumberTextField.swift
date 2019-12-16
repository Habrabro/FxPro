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
    
    var fpnTextField: FPNTextField?
    
    override init(frame aFrame: CGRect) {
        super.init(frame: aFrame)
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    @objc private func editingChanged() {
        guard let text = text else { return }
        fpnTextField!.text = text
        fpnTextField!.updateUI()
        self.text = fpnTextField!.text
    }
}
