//
//  ViewController.swift
//  fxpro
//
//  Created by admin on 04/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import TweeTextField
import FlagPhoneNumber

enum Fields {
    case streetAndNumber
    case postalZipCode
    case cityTown
    case nationality
    case dateOfBirth
}

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var streetAndNumberTextField: ValidatableTextField!
    @IBOutlet weak var postalZipCodeTextField: ValidatableTextField!
    @IBOutlet weak var cityTownTextField: ValidatableTextField!
    @IBOutlet weak var nationalityTextField: ValidatableTextField!
    @IBOutlet weak var dateOfBirthTextField: ValidatableTextField!
    @IBOutlet weak var countryCodeTextField: TweeAttributedTextField!
    @IBOutlet weak var contactNumberTextField: TweeAttributedTextField!
    
    @IBOutlet weak var emailSubscriptionsDetailsTextView: DetailsTextView!
    
    // MARK: Public properties
    
    // MARK: Private properties
    
    private let dateFormatter = DateFormatter()
    private let datePicker = UIDatePicker()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(didDoneTap))
        self.view.addGestureRecognizer(dismissTapGesture)
        
        // streetAndNumberTextField
        
        let streetNumberValidator = ValidatorFactory.validatorFor(type: .streetAndNumber)
        streetAndNumberTextField.setup(validator: streetNumberValidator)
        
        // postalZipCodeTextField
        
        let postalZipCodeValidator = ValidatorFactory.validatorFor(type: .postalZipCode)
        postalZipCodeTextField.setup(validator: postalZipCodeValidator)
        
        // cityTownTextField
        
        let cityTownValidator = ValidatorFactory.validatorFor(type: .cityTown)
        cityTownTextField.setup(validator: cityTownValidator)
        
        // nationalityTextField
        
        let nationalityValidator = ValidatorFactory.validatorFor(type: .nationality)
        nationalityTextField.setup(validator: nationalityValidator)
        
        var image = UIImage(named: "expandableIcon")
        image = UIImage.resize(image: image!, targetSize: CGSize(width: 12, height: 12))
        let expandableIconImageView = UIImageView(image: image)
        nationalityTextField.rightView = expandableIconImageView
        nationalityTextField.rightViewMode = .always
        
        let nationalityTextFieldTapGesture = UITapGestureRecognizer(target: self, action: #selector(nationalityTextFieldDidTap))
        nationalityTextField.addGestureRecognizer(nationalityTextFieldTapGesture)
        
        // dateOfBirthTextField
        
        let dateOfBirthValidator = ValidatorFactory.validatorFor(type: .dateOfBirth)
        dateOfBirthTextField.setup(validator: dateOfBirthValidator)
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerDateChanged), for: .valueChanged)
        dateOfBirthTextField.inputView = datePicker
        dateFormatter.dateFormat = "MM.dd.yyyy"
        
        // countryCodeTextField
        
        let plusSymbolLabel = UILabel()
        plusSymbolLabel.text = "+"
        countryCodeTextField.leftViewMode = .always
        countryCodeTextField.leftView = plusSymbolLabel
        
        // contactNumberTextField
        
        // emailSubscriptionsDetailsTextView
        
        emailSubscriptionsDetailsTextView.setupAttributes()
    }
    
    // MARK: Public methods
    
    // MARK: Actions
    
    @IBAction func nextStepButtonDidTap(_ sender: Any) {
        if areFieldsValid() {
            let fields: [Fields: String] = [
                .streetAndNumber: streetAndNumberTextField.text!,
                .postalZipCode: postalZipCodeTextField.text!,
                .cityTown: cityTownTextField.text!,
                .nationality: nationalityTextField.text!,
                .dateOfBirth: dateOfBirthTextField.text!,
            ]
            //...
        }
    }
    
    
    // MARK: Private methods
    
    private func areFieldsValid() -> Bool {
        if streetAndNumberTextField.isDataValid &&
        postalZipCodeTextField.isDataValid &&
        cityTownTextField.isDataValid &&
        nationalityTextField.isDataValid &&
        dateOfBirthTextField.isDataValid {
            return true
        } else {
            validateAllTextFields()
            return false
        }
    }
    
    private func validateAllTextFields() {
        streetAndNumberTextField.validate()
        postalZipCodeTextField.validate()
        cityTownTextField.validate()
        nationalityTextField.validate()
        dateOfBirthTextField.validate()
    }
    
    // MARK: Selectors
    
    @objc private func nationalityTextFieldDidTap(_ sender: TweeAttributedTextField) {
        let countriesPickerViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CountriesPickerViewController") as! CountriesPickerViewController
        countriesPickerViewController.delegate = self
        self.view.endEditing(true)
        navigationController?.pushViewController(countriesPickerViewController, animated: true)
    }
    
    @objc private func didDoneTap() {
        view.endEditing(true)
    }
    
    @objc private func datePickerDateChanged(_ sender: UIDatePicker) {
        let date = sender.date
        let formattedDate = dateFormatter.string(from: date)
        dateOfBirthTextField.text = formattedDate
    }
}

// MARK: Extension for CountriesPickerDelegate protocol implementation

extension ViewController: CountriesPickerDelegate {
        
    func countriesPicker(_ picker: CountriesPickerViewController, didFinishPickingCountry country: String) {
        nationalityTextField.text = country
        nationalityTextField.validate()
    }
}
