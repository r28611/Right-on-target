//
//  Game.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 12/12/2021.
//

import Foundation

class Game: GameProtocol {
    
    var secretValueGenerator: GeneratorProtocol
    
    var currentRound: GameRoundProtocol!
    
    var score: Int = 0
    var roundCouner: Int = 0
    var maxRound: Int
    var isGameEnded: Bool {
        roundCouner >= maxRound ? true : false
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        secretValueGenerator = Generator(startValue: startValue, endValue: endValue)!
        maxRound = rounds
        startNewRound()
    }
    
    func restartGame() {
        roundCouner = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        roundCouner += 1
        currentRound = GameRound(with: secretValueGenerator.getRandomValue())
    }
    
    func calculateScore(with value: Int) {
        currentRound.calculateScore(with: value)
        score += currentRound.score
    }
}
