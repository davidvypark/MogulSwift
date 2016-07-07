//
//  Item1.swift
//  test
//
//  Created by David Park on 7/1/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import Foundation

enum calculateByCost: Int {
    case item1Identifier, item2Identifier, item3Identifier, item4Identifier, item5Identifier, item6Identifier
}

struct ItemToBuy {
    let name: String
    var incomeValue: Int
    var incomeTime: Float                   //remove
    var price: Double
    var priceNumberValue: Double            //remove
    var priceSuffix: String
    let incomeIncrement: Int
    var count: Int
    let initialPrice: Int
    var costIdentifier: calculateByCost!    //remove
    
    
    
    //item1pricecalc func
    //item2pricecalc func
    //item3 func
}


