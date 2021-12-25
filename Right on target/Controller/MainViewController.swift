//
//  MainViewController.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 13/12/2021.
//

import UIKit

protocol MainViewControllerProtocol {
    func guessNumberChoosen()
    func guessColorChoosen()
    func showAboutScreen()
}

class MainViewController: UIViewController, MainViewControllerProtocol {
    
    private var mainView = MainMenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.viewDelegate = self
    }
    
    func guessNumberChoosen() {
        let vc = GuessNumberViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func guessColorChoosen() {
        let vc = GuessColorViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showAboutScreen() {
        let vc = AboutViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
