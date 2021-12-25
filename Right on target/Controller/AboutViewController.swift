//
//  AboutViewController.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 12/12/2021.
//

import UIKit

class AboutViewController: UIViewController {
    
    private lazy var hideButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Назад", for: .normal)
        button.addTarget(self, action: #selector(hideCurrentScene), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(hideButton)
        NSLayoutConstraint.activate([
            hideButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hideButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func hideCurrentScene() {
        self.dismiss(animated: true, completion: nil)
    }

}
