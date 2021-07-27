//
//  ViewController.swift
//  Concentr
//
//  Created by Romilda Voltigore on 7/27/21.
//  Copyright © 2021 Romilda Voltigore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = ConcentrationGame(numberCards: numberOfPairOfcards)
    
    var numberOfPairOfcards: Int
    {
        return(buttonCollection.count + 1) / 2
    }
    
    private(set) var touches = 0
    {
        didSet
        {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    private var emojiCollection = ["🐶", "🦁", "🦊", "🐵", "🐭", "🐤", "🐧", "🐦", "🐸", "🐼", "🐻", "🐰", "🐯"]
    
    private var emojiDict = [Int:String]()
    
    
    
    private func emojiIdentify(for card: Card) -> String
    {
        if emojiDict[card.identify] == nil
        {
            emojiDict[card.identify] = emojiCollection.remove(at: emojiCollection.count.arc4randomExtension)
        }
        return emojiDict[card.identify] ?? "?"
    }
    
    private func updateViewFromModel()
    {
        for index in buttonCollection.indices
        {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceup
            {
                button.setTitle(emojiIdentify(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else
            {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMathed ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.4756552577, blue: 1, alpha: 1)
            }
        }
    }
    
    @IBOutlet private weak var touchLabel: UILabel!
    @IBOutlet private var buttonCollection: [UIButton]!
    @IBAction private func touchButton(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender)
        {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
}

extension Int
{
    var arc4randomExtension: Int
    {
        if self > 0
        {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0
        {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else
        {
            return 0
        }
    }
}

