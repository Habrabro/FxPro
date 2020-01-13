//
//  PasswordHintView.swift
//  fxpro
//
//  Created by admin on 13/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class PasswordHintView: UIView {

    // MARK: Outlets
    
    @IBOutlet weak var contentView: UIView!

    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("PasswordHintView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setupLayout()
    }
    
    private func setupLayout() {
        let shadowedBackdropProvider = ShadowedBackdropProvider()
        let backdrop = shadowedBackdropProvider.getShadowedBackdrop()
        insertSubview(backdrop, belowSubview: contentView)
        backdrop.translatesAutoresizingMaskIntoConstraints = false
    }

}
