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
        collectionView?.register(PinterestLayoutCell.self, forCellWithReuseIdentifier: pinterestCellReuseIdentifier)
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: PinterestLayout())
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
    }
}

extension PinterestLayoutViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pinterestCellReuseIdentifier, for: indexPath as IndexPath) as! PinterestLayoutCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
}

extension PinterestLayoutViewController: PinterestLayoutDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        return CGFloat.random(in: 30...200)
    }
}

final class PinterestLayoutCell: UICollectionViewCell {
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
