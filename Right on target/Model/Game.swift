//
//  Game.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 12/12/2021.
//

import Foundation

protocol GameProtocol {
    
    associatedtype SecretType

    var score: Int { get }
    
    var secretValue: SecretType { get }

    var isGameEnded: Bool { get }

    func restartGame()

    func startNewRound()

    func calculateScore(secretValue: SecretType, userValue: SecretType)
}

class Game<T: SecretValueProtocol>: GameProtocol {
    typealias SecretType = T
    
    var score: Int = 0
    var secretValue: T
    var currentRound: Int = 0
    private var compareClosure: (T, T) -> Int
    var roundCounter: Int!
    var isGameEnded: Bool {
        currentRound >= roundCounter ? true : false
    }
    
    init(secretValue: T, rounds: Int, compareClosure: @escaping (T, T) -> Int) {
        self.secretValue = secretValue
        roundCounter = rounds
        self.compareClosure = compareClosure
        startNewRound()
    }
    
    func restartGame() {
        roundCounter = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentRound += 1
        self.secretValue.setRandomValue()
    }
    
    func calculateScore(secretValue: T, userValue: T) {
        score = score + compareClosure(secretValue, userValue)
    }
}
