//
//  CustomPhoneNumberTextField.swift
//  fxpro
//
//  Created by admin on 10/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import PhoneNumberKit

class CustomPhoneNumberTextField: PhoneNumberTextField {
    
    // MARK: Private properties
    
    private let regionCode = Locale.current.regionCode
    
    private var _defaultRegion: String?
    override var defaultRegion: String {
        get {
            return _defaultRegion ?? regionCode ?? "US"
        }
        set {
            _defaultRegion = newValue
        }
    }
    
    // MARK: Public methods
    
    public func setDefaultRegion(to defaultRegion: String) {
        _defaultRegion = defaultRegion
    }
    
}
