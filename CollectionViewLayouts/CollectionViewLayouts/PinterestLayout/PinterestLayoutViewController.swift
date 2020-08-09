//
//  PinterestViewController.swift
//  CollectionViewLayouts
//
//  Created by Ricardo Duarte on 26/07/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import UIKit

let pinterestCellReuseIdentifier: String = "pinterestLayoutCell"

class PinterestLayoutViewController: UIViewController {
    var collectionView: UICollectionView?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: PinterestLayout())
        collectionView?.register(PinterestLayoutCell.self, forCellWithReuseIdentifier: pinterestCellReuseIdentifier)
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        collectionView?.dataSource = self
        view.addSubview(collectionView!)
    }
}

extension PinterestLayoutViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pinterestCellReuseIdentifier, for: indexPath) as! PinterestLayoutCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
}

extension PinterestLayoutViewController: PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        CGFloat.random(in: 30...200)
    }
}

final class PinterestLayoutCell: UICollectionViewCell {
    let container = UILabel()
    let colors: [UIColor] = [.red, .yellow, .blue, .gray, .green, .black, .brown, .cyan, .magenta, .orange, .purple, .white]

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(container)
        let index = Int.random(in: 0..<11)
        container.backgroundColor = colors[index]
        container.translatesAutoresizingMaskIntoConstraints = false
        container.topAnchor.constraint(equalTo: topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        container.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        container.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
