//
//  GuessColorViewController.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 13/12/2021.
//

import UIKit

class GuessColorViewController: UIViewController, GameViewControllerProtocol {
    
    private var game: Game<SecretColorValue>!
    private var gameView: GuessColorView = GuessColorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        gameView.viewDelegate = self
        game = (GameFactory.getColorGame() as! Game<SecretColorValue>)
        gameView.setColorsForButtons(rightColor: hexStringToUIColor(hex: game.secretValue.value))
        view = gameView
    }

    func checkAnswer() {
        if let color = gameView.choosenColor {
            var userSecretValue = game.secretValue
            userSecretValue.value = color
            game.calculateScore(secretValue: game.secretValue, userValue: userSecretValue)
            if game.isGameEnded {
                showAlertWith(score: game.score)
                game.restartGame()
            } else {
                game.startNewRound()
            }
            gameView.setColorsForButtons(rightColor: hexStringToUIColor(hex: game.secretValue.value))
        }
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
