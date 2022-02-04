//
//  ViewController.swift
//  ViewControllerTransitions
//
//  Created by Ricardo Duarte on 03/02/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func nextViewControllerButton(_ sender: Any) {
        let vc = ViewControllerB()
        self.present(vc, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}
