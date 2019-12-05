//
//  DetailsTextView.swift
//  fxpro
//
//  Created by admin on 05/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

@IBDesignable
class DetailsTextView: UITextView {
    
    // MARK: Inspectables
    
    @IBInspectable var lineSpacing: CGFloat {
        get {
            return style.lineSpacing
        }
        set {
            style.lineSpacing = newValue
        }
    }
    
    // MARK: Private properties
    
    private let style = NSMutableParagraphStyle()
    
    // MARK: Initializers
    
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
    }
    
    func setupAttributes() {
        let text = self.text!
        let fontName = self.font!.familyName
        let fontSize = self.font!.pointSize
        let color = self.textColor
        let attributes = [
            NSAttributedString.Key.paragraphStyle : style,
            NSAttributedString.Key.font: UIFont(name: fontName, size: fontSize)!,
            NSAttributedString.Key.foregroundColor: color
        ]
        self.attributedText = NSAttributedString(string: text, attributes: attributes)
    }
}
