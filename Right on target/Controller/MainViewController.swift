//
//  MainViewController.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 13/12/2021.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func guessNumberChoosen(_ sender: Any) {
        let vc = GuessNumberViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func guessColorChoosen(_ sender: Any) {
        let vc = GuessColorViewController()
        self.present(vc, animated: true, completion: nil)
    }
}
