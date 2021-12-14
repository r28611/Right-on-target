//
//  SecretValue.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 14/12/2021.
//

import Foundation

typealias SecretNumericValue = SecretValue<Int>

typealias SecretColorValue = SecretValue<String>

protocol SecretValueProtocol {

    associatedtype ValueType

    var value: ValueType { get }

    mutating func setRandomValue()
}

struct SecretValue<T: Equatable>: SecretValueProtocol {
    typealias ValueType = T
    var value: T

    private let randomValueClosure: (T) -> T
    init(initialValue: T, randomValueClosure: @escaping (T) -> T) {
        value = initialValue
        self.randomValueClosure = randomValueClosure
    }
    mutating func setRandomValue(){
        self.value = randomValueClosure(self.value)
    }
}
