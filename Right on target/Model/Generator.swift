//
//  Generator.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 12/12/2021.
//

import Foundation

class Generator: GeneratorProtocol {
    
    private var minSecretValue: Int
    private var maxSecretValue: Int
    
    init?(startValue: Int, endValue: Int) {
        guard startValue <= endValue else { return nil }
        minSecretValue = startValue
        maxSecretValue = endValue
    }
    
    func getRandomValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
    
    
}
