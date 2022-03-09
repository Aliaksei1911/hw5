//
//  PubManager.swift
//  BeerPub
//
//  Created by 1 on 22.02.22.
//

import Foundation

class PubManager {
    
    var beers: [BeerModel] = [
        BeerModel(name: "Grizzly",
                  price: 9.0,
                  country: "USA",
                  remainingVolume: 100),
        BeerModel(name: "IPA",
                  price: 8.5,
                  country: "India",
                  remainingVolume: 300),
        BeerModel(name: "Blanche",
                  price: 7.5,
                  country: "Belgian",
                  remainingVolume: 400),
        BeerModel(name: "Irish red Ale",
                  price: 10.0,
                  country: "Ireland",
                  remainingVolume: 250),
    ]
    
    private var money: Double = 0.0
    
    static let shared: PubManager = PubManager ()
    
    private init () { }
    
    func sellBeer(onTap index: Int, volume: Double) -> Bool {
        guard index >= 0, index < beers.count else { return false }
        guard beers[index].remainingVolume >= volume else { return false }
        
        money += beers[index].price * volume
        beers[index].remainingVolume -= volume
        return true
    }
    
    func checkMoney() -> Double { money }
    
    func startNewDay() {
        money = 0
    }
    
    func checkRemaningVolume(onTap index: Int) -> String {
        guard index >= 0, index < beers.count else { return "Ошибка в загрузке пиво" }
        
        return beers[index].getDescription()
    }
}
