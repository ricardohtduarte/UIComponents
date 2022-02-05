//
//  ViewController.swift
//  ViewControllerTransitions
//
//  Created by Ricardo Duarte on 03/02/2022.
//

import UIKit

class GridViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: "cell")
    }
}

extension GridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AlbumCell
        cell.albumImageView.image = UIImage(named: "album.png")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = FullScreenViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

extension GridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 30
        let collectionViewSize: CGFloat = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

extension GridViewController: UICollectionViewDelegate {
}

class AlbumCell: UICollectionViewCell {
    let albumImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(albumImageView)

        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        albumImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        albumImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        albumImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        albumImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
