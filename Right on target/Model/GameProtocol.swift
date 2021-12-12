//
//  GameProtocol.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 12/12/2021.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    var isGameEnded: Bool { get }
    func restartGame()
    func startNewRound()
    func calculateScore(with value: Int)
}
