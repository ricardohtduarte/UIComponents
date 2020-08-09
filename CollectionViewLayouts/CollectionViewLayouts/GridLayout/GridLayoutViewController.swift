//
//  GridViewController.swift
//  CollectionViewLayouts
//
//  Created by Ricardo Duarte on 21/07/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import UIKit

let reuseIdentifier = "gridLayoutCell"

final class GridLayoutViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let numberOfColumns: CGFloat = 5.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }

    private func configureCollectionView() {
        collectionView.register(GridLayoutCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension GridLayoutViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfPaddings: CGFloat = numberOfColumns + 1.0
        let blankSpaces = numberOfPaddings * 10
        let squareDimension = (collectionView.frame.width - blankSpaces) / numberOfColumns
        return CGSize(width: squareDimension, height: squareDimension)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}


extension GridLayoutViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GridLayoutCell
        return cell
    }
}


final class GridLayoutCell: UICollectionViewCell {
    let container = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(container)
        container.backgroundColor = .red
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


