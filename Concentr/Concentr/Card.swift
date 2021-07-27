//
//  Card.swift
//  Concentr
//
//  Created by Romilda Voltigore on 7/27/21.
//  Copyright © 2021 Romilda Voltigore. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceup = false
    var isMathed = false
    var identify: Int
    
    private static var identifityNumber = 0
    
    private static func identifyGenerator() -> Int
    {
        identifityNumber += 1
        return identifityNumber
    }
    
    init()
    {
        self.identify = Card.identifyGenerator()
    }
}
