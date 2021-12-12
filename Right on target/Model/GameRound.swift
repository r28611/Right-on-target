//
//  GameRound.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 12/12/2021.
//

import Foundation

class GameRound: GameRoundProtocol {
    
    var score: Int = 0
    
    var currentSecretValue: Int?
    
    init?(with secretValue: Int) {
        self.currentSecretValue = secretValue
    }
    
    func calculateScore(with value: Int) {
        if let currentValue = currentSecretValue {
            if value > currentValue {
                score += 50 - value + currentValue
            } else if value < currentValue {
                score += 50 - currentValue + value
                } else {
                        score += 50
                    }
        }

    }
    
    
}
