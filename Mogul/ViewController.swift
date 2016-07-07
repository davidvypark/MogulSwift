//
//  ViewController.swift
//  test
//
//  Created by David Park on 7/1/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewSlot1: ItemView!
    @IBOutlet weak var viewSlot2: ItemView!
    @IBOutlet weak var viewSlot3: ItemView!
    @IBOutlet weak var viewSlot4: ItemView!
    @IBOutlet weak var viewSlot5: ItemView!
    @IBOutlet weak var viewSlot6: ItemView!
    
    @IBOutlet weak var InternButtonPresed: UIButton!
    @IBOutlet weak var tapHereToStartEarning: UILabel!
    @IBOutlet weak var masterScoreLabel: UILabel!
    @IBOutlet weak var suffixLabel: UILabel!
    
    var timer: NSTimer!
    var masterScore = 0.0
    
    override func viewWillDisappear(animated: Bool) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //temporary int and float values. Change later to default values
        //might be able to get rid of the itemIdentifiers I dont think I need them for anything
        
        let item1 = ItemToBuy(name: "Dorm Room Startup", incomeValue: 0, incomeTime: 1.0, price: 1.00, priceNumberValue: 1.00, priceSuffix: "", incomeIncrement: 1, count: 0, initialPrice: 1, costIdentifier: .item1Identifier)
        let item2 = ItemToBuy(name: "Viral Game App", incomeValue: 0, incomeTime: 1.0, price: 15.00, priceNumberValue: 15.00, priceSuffix: "", incomeIncrement: 4, count: 0, initialPrice: 15, costIdentifier: .item2Identifier)
        let item3 = ItemToBuy(name: "Gluten Free Something", incomeValue: 0, incomeTime: 1.0, price: 221.00, priceNumberValue: 221.00, priceSuffix: "", incomeIncrement: 16, count: 0, initialPrice: 221, costIdentifier: .item3Identifier)
        let item4 = ItemToBuy(name: "Bluetooth Yoga Pants", incomeValue: 0, incomeTime: 1.0, price: 3294.00, priceNumberValue: 3294.00, priceSuffix: "", incomeIncrement: 64, count: 0, initialPrice: 3294, costIdentifier: .item4Identifier)
        let item5 = ItemToBuy(name: "Synergistic Disruptive Cross-Platform Integrated Systems", incomeValue: 0, incomeTime: 1.0, price: 49020.00, priceNumberValue: 49020.00, priceSuffix: "", incomeIncrement: 256, count: 0, initialPrice: 409020, costIdentifier: .item5Identifier)
        let item6 = ItemToBuy(name: "Free Range Artificial Intelligence", incomeValue: 0, incomeTime: 1.0, price: 729416.00, priceNumberValue: 729416.00, priceSuffix: "", incomeIncrement: 1024, count: 0, initialPrice: 729416, costIdentifier: .item6Identifier)
        
        viewSlot1.itemToInsert = item1
        viewSlot2.itemToInsert = item2
        viewSlot3.itemToInsert = item3
        viewSlot4.itemToInsert = item4
        viewSlot5.itemToInsert = item5
        viewSlot6.itemToInsert = item6
        
        self.tapHereToStartEarning.adjustsFontSizeToFitWidth = true
        self.suffixLabel.text = suffixArray[0]
        print(suffixArray[1])
        
        [runTimer()]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func internButtonPressed(sender: UIButton) {
        masterScore += 1
        masterScoreLabel.text = String(Int(masterScore))
        
        //print ("aggregateIncome = " + String(calculateAggregateIncome()))
    }
    
    func calculateAggregateIncome() -> Double {
        let firstHalf = self.viewSlot1.itemToInsert.incomeValue + self.viewSlot2.itemToInsert.incomeValue + self.viewSlot3.itemToInsert.incomeValue
        let secondHalf = self.viewSlot4.itemToInsert.incomeValue + self.viewSlot5.itemToInsert.incomeValue + self.viewSlot6.itemToInsert.incomeValue
        
        return Double(firstHalf + secondHalf)
    }
    
    func runTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(updateMasterScore), userInfo: nil, repeats: true)
    }
    
    func updateMasterScore() {
        masterScore += self.calculateAggregateIncome()/10
        print(self.calculateAggregateIncome())                      //For Testing, DELETE
        print(self.masterScore)                                     //For Testing, DELETE
        
        
        
        print(self.suffixLabel.text!)
        
        
        
        
        if (self.suffixLabel.text! == "") {
            if (self.masterScore >= 1000000) {
                self.masterScore = self.masterScore/1000000.0
                //divide all the income by a mil
                //divide the total income by a mil ^should autocompleted if i do the above
                suffixLabel.text = changeToNextSuffix(self.suffixLabel.text!)
                masterScoreLabel.text = NSString(format: "%.3f", (masterScore)) as String
            }
        } else {
            
            if (self.masterScore >= 1000) {
                self.masterScore = self.masterScore/1000.0
                changeToNextSuffix(self.suffixLabel.text!)
                masterScoreLabel.text = NSString(format: "%.3f", (masterScore)) as String
                
            } else if (masterScore < 1) {
                
                //go backwards in suffix | need to make a new method for that
                
            } else {
                self.masterScoreLabel.text = String(Int(self.masterScore))
            }
        }
    }
    
    func checkForButtonEnabled() {

    }

    func saveUserDate() {
        //FireBase
        
    }
    
    func loadUserData() {
        //FireBase
        
    }

}

