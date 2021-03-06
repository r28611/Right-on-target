//
//  GuessNumberViewController.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 10/12/2021.
//

import UIKit

class GuessNumberViewController: UIViewController, GameViewControllerProtocol {
    
    private var game: Game<SecretNumericValue>!
    private var gameView: GuessNumberView = GuessNumberView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = gameView
        gameView.viewDelegate = self
        game = (GameFactory.getNumericGame() as! Game<SecretNumericValue>)
        updateLabelWithSecretNumber(newText: String(game.secretValue.value))
    }
    
    // MARK: - Взаимодействие View - Model
    
    func checkAnswer() {
        var userSecretValue = game.secretValue
        userSecretValue.value = Int(gameView.slider.value)
        game.calculateScore(secretValue: game.secretValue, userValue: userSecretValue)
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.secretValue.value))
    }
    
    // MARK: - Обновление View
    private func updateLabelWithSecretNumber(newText: String) {
        gameView.label.text = newText
    }
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Игра окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново",
                                      style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

