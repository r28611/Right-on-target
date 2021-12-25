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
        self.present(vc, animated: true, completion: nil)
    }
    
    func guessColorChoosen() {
        let vc = GuessColorViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    func showAboutScreen() {
        let vc = AboutViewController()
        self.present(vc, animated: true, completion: nil)
    }
}
