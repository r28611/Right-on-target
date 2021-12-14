//
//  MainViewController.swift
//  Right on target
//
//  Created by Margarita Novokhatskaia on 13/12/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var secondViewController: UIViewController = AboutViewController()

    override func loadView() {
        super.loadView()
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.text = "Версия 1.3"
        self.view.addSubview(versionLabel)
    }
    
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
    
    @IBAction func showAboutScreen(_ sender: Any) {
        self.present(secondViewController, animated: true, completion: nil)
    }
}
