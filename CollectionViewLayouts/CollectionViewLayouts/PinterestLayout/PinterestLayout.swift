import UIKit

protocol PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: NSIndexPath) -> CGFloat
}

class PinterestLayout: UICollectionViewLayout {
    var delegate: PinterestLayoutDelegate!
    var numberOfColumns = 2

    private var cache = [UICollectionViewLayoutAttributes]()
    private var contentHeight: CGFloat = 0

    private var width: CGFloat {
        get {
            return collectionView!.bounds.width
        }
    }

    // Provide the collection view with enough information to configure scrolling
    override var collectionViewContentSize: CGSize {
         CGSize(width: width, height: contentHeight)
    }

    // Pre calculate the layout
    // Called whenever a layout operation is gonna take place
    override func prepare() {
        if cache.isEmpty {
            let columnWidth = width / CGFloat(numberOfColumns)

            var xOffsets: [CGFloat] = []

            for column in 0..<numberOfColumns {
                xOffsets.append(CGFloat(column) * columnWidth)
            }

            var yOffset = [CGFloat](repeating: CGFloat(0), count: numberOfColumns)

            var currentColumn: Int = 0

            for item in 0..<collectionView!.numberOfItems(inSection: 0) {
                let indexPath = IndexPath(item: item, section: 0)
                // Get item's height
                let height = delegate.collectionView(collectionView: collectionView!, heightForItemAtIndexPath: indexPath as NSIndexPath)

                // Create frame and attributes for item
                let frame = CGRect(x: xOffsets[currentColumn],
                                   y: yOffset[currentColumn],
                                   width: columnWidth,
                                   height: height)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = frame
                cache.append(attributes)
                contentHeight = max(contentHeight, frame.maxY)

                // Update Y axis
                yOffset[currentColumn] = yOffset[currentColumn] + height

                // Update current Column
                if currentColumn >= (numberOfColumns - 1) {
                    currentColumn = 0
                } else {
                    currentColumn += 1
                }
            }
        }
    }

    // Check with layoutAttributes intersect the rect that is passed as argument from the collectionView
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes: [UICollectionViewLayoutAttributes] = []
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
}
