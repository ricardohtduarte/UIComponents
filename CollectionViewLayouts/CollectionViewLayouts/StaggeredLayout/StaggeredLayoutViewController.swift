////
////  StaggeredLayoutViewController.swift
////  CollectionViewLayouts
////
////  Created by Ricardo Duarte on 27/07/2020.
////  Copyright © 2020 HappiOS. All rights reserved.
////
//
//import UIKit
//
//class StaggeredLayoutViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//}
//
//class StaggeredLayout: UICollectionViewLayout {
//    private let itemSize = CGSize(width: 100, height: 90)
//    private let itemSpacing: CGFloat = 10
//
////    private var numberOfItems: Int
////    private var numberOfRows: Int
////    private var numberOfColumns: Int
//
//    private var layoutAttributes = [UICollectionViewLayoutAttributes]()
//
//    override var collectionViewContentSize: CGSize {
//        return .zerog m
//    }
//
//    override func prepare() {
//        // 1
//        guard let collectionView = self.collectionView else {
//            return
//        }
//        let availableHeight = Int(collectionView.bounds.height + itemSpacing)
//        let itemHeight = Int(itemSize.height + itemSpacing)
//        let numberOfItems = collectionView.numberOfItems(inSection: 0)
//        let numberOfRows = availableHeight / itemHeight
//        let numberOfColumns = Int(ceil(CGFloat(numberOfItems) / CGFloat(numberOfRows)))
//        layoutAttributes.removeAll()
//
//        // 2
//        layoutAttributes = (0..<numberOfItems).map { itemIndex in
//            let row = itemIndex % numberOfRows
//            let column = itemIndex / numberOfRows
//            var xPosition = column * Int(itemSize.width + itemSpacing)
//            if row % 2 == 1 {
//                xPosition += Int(itemSize.width / 2)
//            }
//            let yPosition = row * Int(itemSize.height + itemSpacing)
//            // 3
//            let indexPath = IndexPath(row: itemIndex, section: 0)
//            let attributes = UICollectionViewLayoutAttributes(forCellWith:
//                indexPath)
//            attributes.frame = CGRect(x: CGFloat(xPosition), y: CGFloat(yPosition), width: itemSize.width, height: itemSize.height)
//            return attributes
//        }
//    }
//
//    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
//        return false
//    }
//
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        return nil
//    }
//
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        return nil
//    }
//}
