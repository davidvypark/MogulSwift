//
//  ItemView.swift
//  Mogul
//
//  Created by David Park on 7/1/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import UIKit

// creates power function
infix operator ^^ { }
func ^^ (radix: Double, power: Double) -> Double {
    return pow(Double(radix), Double(power))
}



class ItemView: UIView {
    
    @IBOutlet var contentView: ItemView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var buyButton: ShadowButton!
    @IBOutlet weak var itemNameText: UITextView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var itemCostLabel: UILabel!
    @IBOutlet weak var priceSuffixLabel: UILabel!
    @IBOutlet weak var dollarSignStaticLabel: UILabel!

    var itemToInsert: ItemToBuy! {
        didSet {
            
            itemNameText.text = itemToInsert.name
            itemImage.image = UIImage.init(named: itemToInsert.name)
            itemCountLabel.text = String(itemToInsert.count)
            if (itemToInsert.priceSuffix == "") {
                itemCostLabel.text = NSString(format: "%.2f", (itemToInsert.price)) as String
            } else {
                itemCostLabel.text = NSString(format: "%.3f", (itemToInsert.price)) as String
            }
            priceSuffixLabel.text = itemToInsert.priceSuffix
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        NSBundle.mainBundle().loadNibNamed("ItemView", owner: self, options: nil)
        self.addSubview(self.contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        contentView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
        contentView.leftAnchor.constraintEqualToAnchor(self.leftAnchor).active = true
        contentView.rightAnchor.constraintEqualToAnchor(self.rightAnchor).active = true
        
        itemCostLabel.adjustsFontSizeToFitWidth = true
        itemCountLabel.adjustsFontSizeToFitWidth = true
        priceSuffixLabel.adjustsFontSizeToFitWidth = true
        dollarSignStaticLabel.adjustsFontSizeToFitWidth = true
        
        itemNameText.layer.shadowOpacity = 1.0
        itemNameText.layer.shadowRadius = 0.0
        itemNameText.layer.shadowColor = UIColor.blackColor().CGColor
        itemNameText.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        
        buyButton.layer.shadowOpacity = 0.4
        buyButton.layer.shadowRadius = 0.0
        buyButton.layer.shadowColor = UIColor.blackColor().CGColor
        buyButton.layer.shadowOffset = CGSizeMake(5.0, 5.0)
        
        itemImage.layer.borderWidth = 2
        itemImage.layer.borderColor = UIColor.peterRiverColor().CGColor
        
        
    }
    
    @IBAction func buyButtonPressed(sender: UIButton) {
        
        itemToInsert.count += 1
        masterScore -= itemToInsert.price
        
        itemToInsert.incomeValue += itemToInsert.incomeIncrement
        itemToInsert.price = itemToInsert.price * 1.14
        
        if (itemToInsert.priceSuffix == "") {
            if (itemToInsert.price >= 1000000) {
                
                itemToInsert.price /= 1000000
                itemToInsert.priceSuffix = changeToNextBrevSuffix(itemToInsert)
            }
        } else {
            if (itemToInsert.price >= 1000) {
                
                itemToInsert.price = itemToInsert.price / 1000
                itemToInsert.priceSuffix = changeToNextBrevSuffix(itemToInsert)
            }
        }
    }
    
    
    
}
