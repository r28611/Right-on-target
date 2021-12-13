//
//  ViewController.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 10/12/2021.
//

import UIKit

protocol GameViewControllerProtocol {
    func checkAnswer()
    func showAboutScreen()
}

class ViewController: UIViewController, GameViewControllerProtocol {
    
    private var game: Game!
    private var gameView: GuessNumberView = GuessNumberView()
    private lazy var secondViewController: UIViewController = AboutViewController()
    
    // MARK: - Жизненный цикл
    
    override func loadView() {
        super.loadView()
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.text = "Версия 1.1"
        self.view.addSubview(versionLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = gameView
        gameView.viewDelegate = self
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue!))
    }
    
    // MARK: - Взаимодействие View - Model
    
    func checkAnswer() {
        let numSlider = Int(gameView.slider.value.rounded())
        game.calculateScore(with: numSlider)
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue!))
    }
    
    func showAboutScreen() {
        self.present(secondViewController, animated: true, completion: nil)
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

