//
//  ShadowedBackdropProvider.swift
//  fxpro
//
//  Created by admin on 13/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ShadowedBackdropProvider {
    
    func getShadowedBackdrop() -> UIView {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 269, height: 116)
        view.backgroundColor = .white

        let shadows = UIView()
        shadows.frame = view.frame
        shadows.clipsToBounds = false
        view.addSubview(shadows)

        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 2)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 16
        layer0.shadowOffset = CGSize(width: 0, height: 0)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)

        let shapes = UIView()
        shapes.frame = view.frame
        shapes.clipsToBounds = true
        view.addSubview(shapes)

        let layer1 = CALayer()
        layer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        layer1.bounds = shapes.bounds
        layer1.position = shapes.center
        shapes.layer.addSublayer(layer1)

        shapes.layer.cornerRadius = 2
        shapes.layer.borderWidth = 1
        shapes.layer.borderColor = UIColor(red: 0.916, green: 0.935, blue: 0.944, alpha: 1).cgColor
        
        return view
    }
    
}
