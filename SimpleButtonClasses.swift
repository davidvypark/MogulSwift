//
//  SimpleButtonClasses.swift
//  Mogul
//
//  Created by David Park on 7/11/16.
//  Copyright © 2016 David Park. All rights reserved.
//

import Foundation
import UIKit

class ShadowButton: SimpleButton {

    override func configureButtonStyles() {
        super.configureButtonStyles()
        setShadowRadius(3, forState: .Normal, animated: true)
        setShadowRadius(10, forState: .Highlighted, animated: true)
        setShadowColor(UIColor.asbestosColor(), forState: .Normal)
        setShadowOpacity(1.0, forState: .Normal, animated: true)
        setShadowOffset(CGSize(width: 0, height: 0), forState: .Normal, animated: true)
    }
}
