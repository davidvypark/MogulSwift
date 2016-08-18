//
//  ViewController.swift
//  test
//
//  Created by David Park on 7/1/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit
import SpriteKit

var masterScore = 0.0

class ViewController: UIViewController {

    @IBOutlet weak var viewSlot1: ItemView!
    @IBOutlet weak var viewSlot2: ItemView!
    @IBOutlet weak var viewSlot3: ItemView!
    @IBOutlet weak var viewSlot4: ItemView!
    @IBOutlet weak var viewSlot5: ItemView!
    @IBOutlet weak var viewSlot6: ItemView!    

    @IBOutlet weak var internButton: SimpleButton!
    @IBOutlet weak var tapHereToStartEarning: UILabel!
    @IBOutlet weak var masterScoreLabel: UILabel!
    @IBOutlet weak var suffixLabel: UILabel!
    
    var timer: NSTimer!
    var currentSuffix = ""

    @IBAction func testResetButton(sender: AnyObject) {
        viewDidLoad()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
		
		
        
        //TESTING: DELETE THIS
        masterScore = 0.0
        //temporary int and float values. Change later to default values
        //might be able to get rid of the itemIdentifiers I dont think I need them for anything
        
        let item1 = ItemToBuy(name: "Dorm Room Startup", incomeValue: 0, incomeTime: 1.0, price: 4.00, priceNumberValue: 4.00, priceSuffix: "", incomeIncrement: 1, count: 0, initialPrice: 4, costIdentifier: .item1Identifier)
        let item2 = ItemToBuy(name: "Viral Game App", incomeValue: 0, incomeTime: 1.0, price: 60.00, priceNumberValue: 60.00, priceSuffix: "", incomeIncrement: 4, count: 0, initialPrice: 60, costIdentifier: .item2Identifier)
        let item3 = ItemToBuy(name: "Gluten Free Something", incomeValue: 0, incomeTime: 1.0, price: 884.00, priceNumberValue: 884.00, priceSuffix: "", incomeIncrement: 16, count: 0, initialPrice: 884, costIdentifier: .item3Identifier)
        let item4 = ItemToBuy(name: "Bluetooth Yoga Pants", incomeValue: 0, incomeTime: 1.0, price: 13176.00, priceNumberValue: 13176.00, priceSuffix: "", incomeIncrement: 64, count: 0, initialPrice: 13176, costIdentifier: .item4Identifier)
        let item5 = ItemToBuy(name: "Synergistic Disruptive Cross-Platform Integrated Systems", incomeValue: 0, incomeTime: 1.0, price: 818040, priceNumberValue: 818040, priceSuffix: "", incomeIncrement: 256, count: 0, initialPrice: 818040, costIdentifier: .item5Identifier)
        let item6 = ItemToBuy(name: "Free Range Artificial Intelligence", incomeValue: 0, incomeTime: 1.0, price: 1.4588, priceNumberValue: 1, priceSuffix: "M", incomeIncrement: 1024, count: 0, initialPrice: 1.4588, costIdentifier: .item6Identifier)
        
        viewSlot1.itemToInsert = item1
        viewSlot2.itemToInsert = item2
        viewSlot3.itemToInsert = item3
        viewSlot4.itemToInsert = item4
        viewSlot5.itemToInsert = item5
        viewSlot6.itemToInsert = item6
        
        self.tapHereToStartEarning.adjustsFontSizeToFitWidth = true
        
        currentSuffix = suffixArray[0]
        self.suffixLabel.text = currentSuffix                       //currentSuffix needs to be pulled from Database
        
        internButton.setShadowColor(UIColor.blackColor())
        internButton.setShadowOffset(CGSizeMake(5,5))
        
        [runTimer()]
    }
    
    override func viewWillDisappear(animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func internButtonPressed(sender: SimpleButton) {
        masterScore += 1
        masterScoreLabel.text = String(Int(masterScore))
    }
    
    func calculateAggregateIncome() -> Double {
        let firstHalf = self.viewSlot1.itemToInsert.incomeValue + self.viewSlot2.itemToInsert.incomeValue + self.viewSlot3.itemToInsert.incomeValue
        let secondHalf = self.viewSlot4.itemToInsert.incomeValue + self.viewSlot5.itemToInsert.incomeValue + self.viewSlot6.itemToInsert.incomeValue
        
        return Double(firstHalf + secondHalf)
    }
    
    func runTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: #selector(updateMasterScore), userInfo: nil, repeats: true)
    }
    
    func updateMasterScore() {
        masterScore += self.calculateAggregateIncome()/20
        checkForButtonEnabled()
        
        if (currentSuffix == "") {
            masterScoreLabel.text = String(Int(masterScore))
        } else {
            masterScoreLabel.text = NSString(format: "%.3f", masterScore) as String
        }
        
        //TESTING: DELETE
        print(self.calculateAggregateIncome())
        print(masterScore)
        //print(currentSuffix)

        
        if (self.suffixLabel.text! == "") {
            if (masterScore >= 1000000) {
                
                //divide all the individual income by a mil
                self.viewSlot1.itemToInsert.incomeIncrement /= 1_000_000
                self.viewSlot2.itemToInsert.incomeIncrement /= 1_000_000
                self.viewSlot3.itemToInsert.incomeIncrement /= 1_000_000
                self.viewSlot4.itemToInsert.incomeIncrement /= 1_000_000
                self.viewSlot5.itemToInsert.incomeIncrement /= 1_000_000
                self.viewSlot6.itemToInsert.incomeIncrement /= 1_000_000
                
                self.viewSlot1.itemToInsert.incomeValue /= 1_000_000
                self.viewSlot2.itemToInsert.incomeValue /= 1_000_000
                self.viewSlot3.itemToInsert.incomeValue /= 1_000_000
                self.viewSlot4.itemToInsert.incomeValue /= 1_000_000
                self.viewSlot5.itemToInsert.incomeValue /= 1_000_000
                self.viewSlot6.itemToInsert.incomeValue /= 1_000_000
                
                masterScore /= 1_000_000.0
                
                //divide the total income by a mil ^should autocompleted if i do the above
                currentSuffix = changeToNextSuffix(currentSuffix)
                //suffixLabel.text = changeToNextSuffix(currentSuffix)
                masterScoreLabel.text = NSString(format: "%.3f", (masterScore)) as String

            }
        } else {
            
            if (masterScore >= 1000) {
                
                self.viewSlot1.itemToInsert.incomeValue /= 1000
                self.viewSlot2.itemToInsert.incomeValue /= 1000
                self.viewSlot3.itemToInsert.incomeValue /= 1000
                self.viewSlot4.itemToInsert.incomeValue /= 1000
                self.viewSlot5.itemToInsert.incomeValue /= 1000
                self.viewSlot6.itemToInsert.incomeValue /= 1000
                
                masterScore /= 1000.0
                currentSuffix = changeToNextSuffix(currentSuffix)
                masterScoreLabel.text = NSString(format: "%.3f", (masterScore)) as String
                
            } else if (masterScore < 1) {
                
                //go backwards in suffix | need to make a new method for that
                
            } else {
                masterScoreLabel.text = NSString(format: "%.3f", (masterScore)) as String
            }
        }
        suffixLabel.text = currentSuffix
        
    }
    
    func goBackwardsInSuffix() {
        
    }
    
    func checkForButtonEnabled() {
        
        viewSlot1.buyButton.enabled = (isPriceLessThanMasterScore(viewSlot1))
        viewSlot2.buyButton.enabled = (isPriceLessThanMasterScore(viewSlot2))
        viewSlot3.buyButton.enabled = (isPriceLessThanMasterScore(viewSlot3))
        viewSlot4.buyButton.enabled = (isPriceLessThanMasterScore(viewSlot4))
        viewSlot5.buyButton.enabled = (isPriceLessThanMasterScore(viewSlot5))
        viewSlot6.buyButton.enabled = (isPriceLessThanMasterScore(viewSlot6))
        
    }

    func saveUserDate() {
        //FireBase
        
    }
    
    func loadUserData() {
        //FireBase
        
    }
    
    func isPriceLessThanMasterScore(viewSlot: ItemView) -> Bool {
        
        
        if (suffixBrevArray.indexOf(viewSlot.priceSuffixLabel.text!) > suffixArray.indexOf(suffixLabel.text!)) {
            return false
        } else if (suffixBrevArray.indexOf(viewSlot.priceSuffixLabel.text!) < suffixArray.indexOf(suffixLabel.text!)) {
            return true
        } else {
            if (viewSlot.itemToInsert.price > masterScore) {
                return false
            } else {
                return true
            }
        }
    }

    
    
}

