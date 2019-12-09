//
//  CountriesPickerViewController.swift
//  fxpro
//
//  Created by admin on 07/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class CountriesPickerViewController: UITableViewController {
    
    // MARK: Constants
    
    let CELL_REUSE_INDENTIFER = "countryCell"
    
    // MARK: Public properties
    
    var delegate: CountriesPickerDelegate?
    
    // MARK: Private properties
    
    private var searchController = UISearchController()
    
    private var countries = NSLocale.isoCountryCodes.map({ code -> String in
        let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
        let name = NSLocale(localeIdentifier: NSLocale.current.identifier).displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found"
        return name
    })
    
    private var filteredCountries = [String]()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchBar.sizeToFit()
            controller.obscuresBackgroundDuringPresentation = false
            controller.searchResultsUpdater = self
            controller.delegate = self
            navigationItem.searchController = controller
            navigationItem.hidesSearchBarWhenScrolling = false
//            tableView.tableHeaderView = controller.searchBar

            return controller
        })()
        
        filteredCountries = countries
        tableView.reloadData()
    }
    
    // MARK: UITableViewController methods overriding
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let _ = delegate else { return }
        delegate?.countriesPicker(self, didFinishPickingCountry: filteredCountries[indexPath.row])
        navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_REUSE_INDENTIFER, for: indexPath)
        cell.textLabel!.text = filteredCountries[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredCountries.count
    }
}

// MARK: Extension for UISearchControllerDelegate implementation

extension CountriesPickerViewController: UISearchControllerDelegate {
    
    func willDismissSearchController(_ searchController: UISearchController) {
        filteredCountries = countries
        tableView.reloadData()
    }
}

// MARK: Extension for UISearchResultsUpdating implementation

extension CountriesPickerViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchBarText = searchController.searchBar.text else { return }
        guard !searchBarText.isEmpty else { return }
        filteredCountries = countries.filter({ country in
            country.lowercased().contains(searchBarText.lowercased())
        })
        tableView.reloadData()
    }
}

// MARK: CountriesPickerDelegate protocol

protocol CountriesPickerDelegate {
    
    func countriesPicker(_ picker: CountriesPickerViewController, didFinishPickingCountry country: String)
}
