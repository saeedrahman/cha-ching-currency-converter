//
//  Currencies.swift
//  ChaChingCurrencyConverter
//
//  Created by Saeed Rahman on 4/10/2018.
//  Copyright © 2018 Saeed Rahman. All rights reserved.
//

import Foundation

class Currencies {
    
    /* globalCurrencies is a dictionary whioh consists of key:pair (String:Double)
     values, e.g. AUD:3.999433. currenctSymbols is and array of currency identifiers
     of type String, and currencyRates is an array of decimal values for the different
     currencies */
    var globalCurrencies = [String:Double]()
    var currencySymbols = [String]()
    var curencyRates = [Double]()
    
    struct Currency: Decodable {
        let base: String
        let date: String
    }
    
    struct CurrencyRates: Decodable {
        let rates: [String:Double]
    }
    
    /* This function fetches the currency data in JSON format. It was written with the
     help of this video: https://youtu.be/YY3bTxgxWss */
    func jsonCurrenciesFetch() {
        
        // Set the base currency. You can find a list of currencies from the link below
        let base = "GBP"
        
        /* URL for the open currencies API. An alternative would be to use fixer.io with
         a free (limited) API key. Interpolates the value of base into the String below */
        let jsonUrlString = "https://api.exchangeratesapi.io/latest?base=\(base)"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                let rates = try JSONDecoder().decode(CurrencyRates.self, from: data)
                
                /* Iterates through the decoded JSON values in CurrencyRates dictionary
                 and appends the keys (currency symbols) and values (decimal rate) to the
                 globalCurrencies dictionary. Additionally, the keys are appended to the
                 currencySymbols array, and values to the currencyRates array */
                for(key, value) in rates.rates {
                    self.globalCurrencies.updateValue(value, forKey: key)
                    self.currencySymbols.append(key)
                    self.curencyRates.append(value)
                }

                print(self.currencySymbols)
                                
            } catch let jsonErr {
                print("Error serialising json:", jsonErr)
            }
            
            }.resume()
    }
}
