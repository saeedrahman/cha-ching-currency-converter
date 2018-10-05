//
//  FirstViewController.swift
//  ChaChingCurrencyConverter
//
//  Created by Saeed Rahman on 4/10/2018.
//  Copyright © 2018 Saeed Rahman. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var vc = Currencies()

    @IBAction func fetchJSONData(_ sender: Any) {
        vc.jsonCurrenciesFetch()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

