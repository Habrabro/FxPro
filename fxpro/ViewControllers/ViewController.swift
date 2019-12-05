//
//  ViewController.swift
//  fxpro
//
//  Created by admin on 04/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import TweeTextField

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var emailSubscriptionsDetailsTextView: DetailsTextView!
    
    // MARK: Public properties
    
    // MARK: Private properties
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailSubscriptionsDetailsTextView.setupAttributes()
    }
    
    // MARK: Public methods
    
    // MARK: Actions
    
    // MARK: Private methods

}

