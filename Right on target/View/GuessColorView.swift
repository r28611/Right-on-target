//
//  GuessColorView.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 13/12/2021.
//

import UIKit

class GuessColorView: UIView {
    
    var rightColor: UIColor?
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonStackview: UIStackView = {
        let stack = UIStackView(arrangedSubviews: createButtons(rightColor: rightColor ?? .white))
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
    
    func setColorsForButtons(rightColor color: UIColor) {
        var colorSet: Set<UIColor> = [color]
        while colorSet.count < 4 {
            colorSet.update(with: .random())
        }
        let colorArray = Array(colorSet)
        for (index, button) in buttonStackview.arrangedSubviews.enumerated() {
            button.backgroundColor = colorArray[index]
        }
        
        label.text = hexStringFromColor(color: color)
        
    }
    
    // MARK: - Private methods
    
    private func setupUi() {
        backgroundColor = UIColor(red: 120.0/255.0, green: 196.0/255.0, blue: 237.0/255.0, alpha: 1.0)
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
    
    private func createButtons(rightColor color: UIColor) -> [UIButton] {
        var buttons = [UIButton]()
        for button in 1...4 {
            buttons.append(createButton(with: "Вариант \(button)"))
        }
        return buttons
    }

    private func createButton(with text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(check), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    @objc private func check() {
        
    }
    
    private func hexStringFromColor(color: UIColor) -> String {
        let components = color.cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0

        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        return hexString
     }
}
