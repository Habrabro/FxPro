//
//  RegistrationTextField.swift
//  fxpro
//
//  Created by admin on 04/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

// UITextView padding bug fix
extension UITextView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    func setup() {
        textContainerInset = UIEdgeInsets.zero
        textContainer.lineFragmentPadding = 0
    }
}
