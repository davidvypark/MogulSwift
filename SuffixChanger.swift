//
//  SuffixChanger.swift
//  Mogul
//
//  Created by David Park on 7/6/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import Foundation


//duct tape temp fix. Use conditionals before calling the suffic functions
let suffixBrevArray = ["","M","B","T","Q","","","","","",""]
let suffixArray = ["","Million","Billion","Trillion","Quadrillion","","","","","",""]

func changeToNextBrevSuffix(item:ItemToBuy) -> String {
    
    let currentIndex = suffixBrevArray.indexOf(item.priceSuffix)
    
    return suffixBrevArray[currentIndex! + 1]
}

func changeToNextSuffix(currentSuffix:String) -> String {
    
    let currentIndex = suffixArray.indexOf(currentSuffix)
    
    return suffixArray[currentIndex! + 1]
}

func changeToPrevBrevSuffix(item:ItemToBuy) -> String {
    
    return ""
}

func changeToPrevSuffix(currentSuffix:String) -> String {
    
    return ""
}

