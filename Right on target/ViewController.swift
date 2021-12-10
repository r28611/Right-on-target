//
//  ViewController.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 10/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
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
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Проверить", for: .normal)
        button.tintColor = .systemIndigo
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

