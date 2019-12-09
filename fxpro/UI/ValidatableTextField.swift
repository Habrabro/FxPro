//
//  ValidatableTextField.swift
//  fxpro
//
//  Created by admin on 09/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import TweeTextField

class ValidatableTextField: TweeAttributedTextField {
    
    // MARK: Public properties
    
    var isDataValid: Bool = false
    
    // MARK: Private properties
    
    private var validator: Validator?
    
    // MARK: Public methods
    
    func setup(validator: Validator) {
        self.validator = validator
        
        rightView = UIImageView(image: UIImage(named: "validIcon"))
        rightView!.isHidden = true
        rightViewMode = .always
        
        addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
    }
    
    func validate() {
        guard let validator = validator, let text = text else { return }
        validator.validate(text, completion: { isValid, message in
            isDataValid = isValid
            if isValid {
                hideInfo()
                rightView?.isHidden = false                
            } else {
                showInfo(message, animated: true)
                rightView?.isHidden = true
            }
        })
    }
    
    // MARK: Selectors
    
    @objc private func editingDidEnd() {
        validate()
    }
}
