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
        configureButtons()
    }


    @IBOutlet var layoutButtons: [UIButton]!

    private func configureButtons() {
        layoutButtons.forEach{ $0.layer.cornerRadius = 20 }
    }

    private func navigateToGridLayout() {
        let storyboard = UIStoryboard(name: "GridLayout", bundle: nil)
        let gridLayoutViewController = storyboard.instantiateViewController(withIdentifier: "GridLayoutViewController")
        present(gridLayoutViewController, animated: true)
    }

    private func navigateToStaggeredLayout() {
//        let staggeredLayoutViewController = StaggeredLayoutViewController()
//        present(staggeredLayoutViewController, animated: true)
    }

    private func navigateToPinterestLayout() {
        let pinterestLayoutViewController = PinterestLayoutViewController()
        present(pinterestLayoutViewController, animated: true)
    }

    private func navigateToCompositionalLayout() {
        let compositionalLayoutViewController = CompositionalLayoutViewController()
        present(compositionalLayoutViewController, animated: true)
    }

    @IBAction func didTapLayout(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        switch button.tag {
        case 0: navigateToGridLayout()
        case 1: navigateToStaggeredLayout()
        case 2: navigateToPinterestLayout()
        case 3: navigateToCompositionalLayout()
        default:
            print("Button not recognized")
            fatalError()
        }
    }
}
