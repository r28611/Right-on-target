//
//  GuessColorViewController.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 13/12/2021.
//

import UIKit

class GuessColorViewController: UIViewController {
    
    private var gameView: GuessColorView = GuessColorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        gameView.setColorsForButtons(rightColor: .systemYellow)
        view = gameView
    }

}
