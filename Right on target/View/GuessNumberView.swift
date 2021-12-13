//
//  GuessNumberView.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 13/12/2021.
//

import UIKit

class GuessNumberView: UIView {

    var viewDelegate: GameViewControllerProtocol?
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var slider: UISlider = {
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
        button.addTarget(self, action: #selector(check), for: .touchUpInside)
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
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUi() {
        backgroundColor = .systemYellow
        addSubview(slider)
        addSubview(label)
        addSubview(checkButton)
        addSubview(aboutButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let margins = layoutMarginsGuide
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

    @objc private func check() {
        self.viewDelegate?.checkAnswer()
    }
    
    @objc private func showAboutScreen() {
        self.viewDelegate?.showAboutScreen()
    }
}
