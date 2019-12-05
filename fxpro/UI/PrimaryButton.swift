//
//  PrimaryButton.swift
//  fxpro
//
//  Created by admin on 05/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

@IBDesignable
class PrimaryButton: UIButton {
    
    // MARK: Inspectables
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    // MARK: Private properties
    
    // MARK: Initializers
    
    override init(frame aFrame: CGRect) {
        super.init(frame: aFrame)
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
    }
}
