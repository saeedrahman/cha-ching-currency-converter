//
//  FirstViewController.swift
//  ChaChingCurrencyConverter
//
//  Created by Saeed Rahman on 4/10/2018.
//  Copyright © 2018 Saeed Rahman. All rights reserved.
//

import UIKit

class CurrenciesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Create an instance of the Currencies class
    var currencies = Currencies()
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currencies.globalCurrencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
//        let keys = [String](currencies.globalCurrencies.keys)
//        let values = [Double](currencies.globalCurrencies.values)
//
//        cell.textLabel?.text = keys[indexPath.row]
//        cell.detailTextLabel?.text = String(values[indexPath.row])

        cell.textLabel?.text = currencies.currencySymbols[indexPath.row]
        cell.detailTextLabel?.text = String(currencies.curencyRates[indexPath.row])
        
        return cell
    }

    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
    }
    
    @IBAction func fetchJSONData(_ sender: Any) {
        //currencies.jsonCurrenciesFetch()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencies.jsonCurrenciesFetch()
        //print(currencies.globalCurrencies)
        tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupNavigationBar()
    }

}

