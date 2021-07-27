//
//  ConcentrationGame.swift
//  Concentr
//
//  Created by Romilda Voltigore on 7/27/21.
//  Copyright © 2021 Romilda Voltigore. All rights reserved.
//

import Foundation

class ConcentrationGame
{
    private(set) var cards = [Card]()
    
    init(numberCards: Int)
    {
        assert(numberCards > 0, "Хотя бы одна карта")
        for _ in 1...numberCards
        {
            let card = Card()
            cards += [card, card]
        }
        for i in 0...cards.count - 1
        {
            if i % 2 == 0
            {
                cards.swapAt(i, i / 2)
            }
        }
    }
    
    private var indexOfTheFaceCard: Int?
    {
        get
        {
            var foundIndex: Int?
            for index in cards.indices
            {
                if cards[index].isFaceup
                {
                    if foundIndex == nil
                    {
                        foundIndex = index
                    }
                    else
                    {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set
        {
            for index in cards.indices
            {
                cards[index].isFaceup = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int)
    {
        if !cards[index].isMathed
        {
            if let mathingIndex = indexOfTheFaceCard, mathingIndex != index
            {
                if cards[mathingIndex].identify == cards[index].identify
                {
                    cards[mathingIndex].isMathed = true
                    cards[index].isMathed = true
                }
                cards[index].isFaceup = true
            }
            else
            {
                indexOfTheFaceCard = index
            }
        }
    }
    
    
    
}
