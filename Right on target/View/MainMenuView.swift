//
//  MainMenuView.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 25/12/2021.
//

import UIKit

class MainMenuView: UIView {
    
    var viewDelegate: MainViewControllerProtocol?

      private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Выберите вариант игры"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.text = "Версия 1.4"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var aboutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Об игре", for: .normal)
        button.addTarget(self, action: #selector(aboutGameSelected), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var colorGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Цвета", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(colorGameSelected), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var numberGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Числа", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(numberGameSelected), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [colorGameButton, label, numberGameButton])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        backgroundColor = .white
        addSubview(stackView)
        addSubview(versionLabel)
        addSubview(aboutButton)
        let margins = layoutMarginsGuide
        NSLayoutConstraint.activate([
            versionLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 16),
            versionLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 16),
            
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: margins.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
            aboutButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 16),
            aboutButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 16)
        ])
    }

    @objc private func colorGameSelected() {
        viewDelegate?.guessColorChoosen()
    }
    
    @objc private func numberGameSelected() {
        viewDelegate?.guessNumberChoosen()
    }
    
    @objc private func aboutGameSelected() {
        viewDelegate?.showAboutScreen()
    }
}
