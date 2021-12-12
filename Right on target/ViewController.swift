//
//  ViewController.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 10/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var game: Game!
    
    private lazy var secondViewController: UIViewController = {
        return AboutViewController()
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = .systemPink
        slider.thumbTintColor = .systemPink
        slider.minimumValueImage = .init(systemName: "01.square.fill")
        slider.maximumValueImage = .init(systemName: "50.square.fill")
        slider.tintColor = .systemPurple
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.value = 25
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Проверить", for: .normal)
        button.tintColor = .systemIndigo
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(checkNumber), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var aboutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("О программе", for: .normal)
        button.addTarget(self, action: #selector(showAboutScreen), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Жизненный цикл
    
    override func loadView() {
        super.loadView()
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.text = "Версия 1.1"
        self.view.addSubview(versionLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    fileprivate func setupUi() {
        view.backgroundColor = .systemYellow
        
        view.addSubview(slider)
        view.addSubview(label)
        view.addSubview(checkButton)
        view.addSubview(aboutButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            slider.widthAnchor.constraint(equalTo: margins.widthAnchor, constant: 40),
            
            checkButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 18),
            checkButton.centerXAnchor.constraint(equalTo: slider.centerXAnchor),
            checkButton.heightAnchor.constraint(equalToConstant: 50),
            
            label.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 18),
            label.centerXAnchor.constraint(equalTo: slider.centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 50),
            
            aboutButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            aboutButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 20)
        ])
    }
    
    // MARK: - Взаимодействие View - Model
    
    @objc private func checkNumber() {
        let numSlider = Int(self.slider.value.rounded())
        game.calculateScore(with: numSlider)
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    @objc private func showAboutScreen() {
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    // MARK: - Обновление View
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
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

