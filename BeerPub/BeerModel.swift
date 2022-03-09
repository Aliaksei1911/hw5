//
//  BeerModel.swift
//  BeerPub
//
//  Created by 1 on 22.02.22.
//

import Foundation

struct BeerModel {
    let name: String
    let price: Double
    let country: String
    var remainingVolume: Double

    func getDescription() -> String {
        """
        \(name), \(country), \(price), р/л
        Остаток:\(remainingVolume) л
        """
        
        
    }
}
