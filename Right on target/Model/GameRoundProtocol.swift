//
//  GameRoundProtocol.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 12/12/2021.
//

import Foundation

protocol GameRoundProtocol {
    var score: Int { get }
    var currentSecretValue: Int? { get }
    func calculateScore(with value: Int)
}
