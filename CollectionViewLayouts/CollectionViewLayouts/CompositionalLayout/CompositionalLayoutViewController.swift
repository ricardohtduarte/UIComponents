//
//  CompositionalLayoutViewController.swift
//  CollectionViewLayouts
//
//  Created by Ricardo Duarte on 21/07/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import UIKit

final class CompositionalLayoutViewController: UICollectionViewController {
    let cellReuseId = "cellId"
    
    init(sectionFactory: CompositionalLayoutSectionFactory = CompositionalLayoutSectionFactory()) {
        let layout = UICollectionViewCompositionalLayout {  (sectionNumber, env) -> NSCollectionLayoutSection in
            switch sectionNumber {
            case 0: return sectionFactory.createHeroCarousel()
            case 1: return sectionFactory.createCategoriesGrid()
            case 2: return sectionFactory.createHorizontalCollection()
            default: return sectionFactory.createDefaultSection()
            }
        }
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellReuseId)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseId, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

struct CompositionalLayoutSectionFactory {
    func createHeroCarousel() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                             heightDimension: .fractionalHeight(1)))
        item.contentInsets.trailing = 30
        item.contentInsets.leading = 30
        item.contentInsets.top = 30
        item.contentInsets.bottom = 30
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                               heightDimension: .absolute(300)),
                                                       subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
    
    func createCategoriesGrid() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(100),
                                                                             heightDimension: .absolute(100)))
        item.contentInsets.trailing = 5
        item.contentInsets.leading = 5
        item.contentInsets.bottom = 10
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                               heightDimension: .estimated(200)),
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    func createHorizontalCollection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                             heightDimension: .fractionalHeight(1)))
        item.contentInsets.trailing = 30
        item.contentInsets.leading = 30
        item.contentInsets.top = 30
        item.contentInsets.bottom = 30
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                               heightDimension: .absolute(300)),
                                                       subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }

    func createDefaultSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                             heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                          heightDimension: .fractionalWidth(1)),
                                                       subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}
