//
//  ViewController.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 10/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    var round: Int = 1
    var points: Int = 0
    
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
        slider.value = 25
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Проверить", for: .normal)
        button.tintColor = .systemIndigo
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(checkNumber), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
        setupUi()
    }
    
    fileprivate func setupUi() {
        view.backgroundColor = .systemYellow
        
        view.addSubview(slider)
        view.addSubview(label)
        view.addSubview(button)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            slider.widthAnchor.constraint(equalTo: margins.widthAnchor, constant: 40),
            
            button.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 18),
            button.centerXAnchor.constraint(equalTo: slider.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 18),
            label.centerXAnchor.constraint(equalTo: slider.centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc private func checkNumber() {
        let numSlider = Int(self.slider.value.rounded())
        if numSlider > self.number {
            self.points += 50 - numSlider + self.number } else if numSlider < self.number {
                self.points += 50 - self.number + numSlider
            } else {
                self.points += 50
            }
        if self.round == 5 {
            let alert = UIAlertController(
                title: "Игра окончена",
                message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.points = 0
        } else {
            self.round += 1
        }
        self.number = Int.random(in: 1...50)
    }
    
}

