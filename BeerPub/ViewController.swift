//
//  ViewController.swift
//  BeerPub
//
//  Created by 1 on 22.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lastMoney: UILabel!
    
    @IBOutlet weak var lastSell: UILabel!
    
    @IBOutlet var beers: [UILabel]!
    
    let volumes: [Double] = [0.5, 1, 1.5, 2]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        lastSell.text = ""
        
        startNewDay(self)
        for index in 0...beers.count {
            updateBeers(withIndex: index)
        }
    }

    @IBAction func updateVolume(_ sender: UIButton) {
        updateBeers(withIndex: sender.tag)
    }
    
    private func updateBeers(withIndex index: Int) {
        guard index >= 0 && index < beers.count else {
            return
        }
        
        beers[index].text =
        PubManager.shared.checkRemaningVolume(onTap: index)
        
    }
    
    @IBAction func checkMoney(_ sender: Any) {
        let currentMoney = PubManager.shared.checkMoney()
        
        lastMoney.text = " Выручка:\n\(currentMoney)"
    }
    
    @IBAction func startNewDay(_ sender: Any) {
        PubManager.shared.startNewDay()
        checkMoney(self)
    }
    
    @IBAction func sellBeer(_ sender: UIButton) {
        
       let beerIndex =  (sender.tag / 10) % 10
        let volumeIndex = sender.tag % 10
        
        guard volumeIndex >= 0, volumeIndex < volumes.count else {
            
            setLastSell(isSuccessful: false)
            
            return
        }
        
        let volume = volumes[volumeIndex]
        let isSuccessfulSell = PubManager.shared.sellBeer(onTap: beerIndex, volume: volume)
        
        updateBeers(withIndex: beerIndex)
        checkMoney(self)
        setLastSell(isSuccessful: isSuccessfulSell)
    }
    
    private func setLastSell (isSuccessful: Bool) {
        lastSell.text = """
        Последняя продажа: \(isSuccessful ? "Успешна" : " Не успешна")
        """
        
    }
    
}

