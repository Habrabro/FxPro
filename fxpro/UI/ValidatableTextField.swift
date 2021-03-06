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
    private var hintView: UIView?
    
    // MARK: Public methods
    
    func setup(validator: Validator, hintView: UIView? = nil) {
        self.validator = validator
        self.hintView = hintView
        
        let imageView = UIImageView(image: UIImage(named: "validIcon"))
        rightView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: imageView.frame.width, height: self.frame.height)))
        rightView!.addSubview(imageView)
        rightView!.isHidden = true
        rightViewMode = .always
        
        addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
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
    
    func switchHintVisibility() {
        guard let hintView = self.hintView else { return }
        hintView.isHidden = !hintView.isHidden
    }
    
    // MARK: Selectors
    
    @objc private func editingDidBegin() {
        switchHintVisibility()
    }
    
    @objc private func editingDidEnd() {
        validate()
        switchHintVisibility()
    }
}
