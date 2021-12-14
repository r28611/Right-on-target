//
//  GuessColorView.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 13/12/2021.
//

import UIKit

class GuessColorView: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "#ffffff"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonStackview: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [createButton(with: "Вариант 1", color: .systemGreen),
                                                   createButton(with: "Вариант 2", color: .systemBlue),
                                                   createButton(with: "Вариант 3", color: .systemYellow),
                                                   createButton(with: "Вариант 4", color: .systemPink)
                                                  ])
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
        backgroundColor = .lightGray
        addSubview(label)
        addSubview(buttonStackview)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let margins = layoutMarginsGuide
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: margins.topAnchor, constant: 32),
            label.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            
            buttonStackview.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 64),
            buttonStackview.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -64),
            buttonStackview.centerYAnchor.constraint(equalTo: margins.centerYAnchor)
        ])
    }

    private func createButton(with text: String, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.backgroundColor = color
        button.tintColor = .black
        button.addTarget(self, action: #selector(check), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    @objc private func check() {
        
    }
}
