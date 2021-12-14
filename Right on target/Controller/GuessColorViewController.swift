//
//  GuessColorViewController.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 13/12/2021.
//

import UIKit

class GuessColorViewController: UIViewController, GameViewControllerProtocol {
    
    private var game: Game!
    private var gameView: GuessColorView = GuessColorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        gameView.viewDelegate = self
        gameView.setColorsForButtons(rightColor: .systemYellow)
        view = gameView
    }

    func checkAnswer() {
        if let color = gameView.choosenColor {
            if gameView.label.text == color {
                showAlertWith(score: 5)
            }
        }
    }
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Вы угадали",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново",
                                      style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
