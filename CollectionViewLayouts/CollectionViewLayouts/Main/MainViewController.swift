//
//  ViewController.swift
//  CollectionViewLayouts
//
//  Created by Ricardo Duarte on 21/07/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import UIKit

enum CollectionViewLayout {
    case gridLayout
    case compositionalLayout
}

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func navigateToGridLayout() {
        let storyboard = UIStoryboard(name: "GridLayout", bundle: nil)
        let gridLayoutViewController = storyboard.instantiateViewController(withIdentifier: "GridLayoutViewController")
        navigationController?.pushViewController(gridLayoutViewController, animated: true)
    }

    func navigateToPinterestLayout() {
        let pinterestLayoutViewController = PinterestLayoutViewController()
        navigationController?.pushViewController(pinterestLayoutViewController, animated: true)
    }

    func navigateToCompositionalLayout() {
        let compositionalLayoutViewController = CompositionalLayoutViewController()
        navigationController?.pushViewController(compositionalLayoutViewController, animated: true)
    }

    @IBAction func didTapLayout(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        switch button.tag {
        case 0: navigateToGridLayout()
        case 1: navigateToPinterestLayout()
        case 2: navigateToCompositionalLayout()
        default:
            print("Button not recognized")
            fatalError()
        }
    }
}
