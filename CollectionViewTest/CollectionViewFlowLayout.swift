//
//  CollectionViewFlowLayout.swift
//  CollectionViewTest
//
//  Created by Michael Nino Evensen on 28/04/16.
//  Copyright © 2016 Michael Nino Evensen. All rights reserved.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {

    /* Cache CollectionView Layout Attributes in array */
//    var cache = [UICollectionViewLayoutAttributes]()
    
    /* Return true so that the layout is continuously invalidated as the user scrolls */
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
//    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
//        
//    }
    
    override func prepareLayout() {
        super.prepareLayout()
        
        self.scrollDirection = UICollectionViewScrollDirection.Horizontal
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let allAttributesInRect = super.layoutAttributesForElementsInRect(rect)
        
        
        for attributes in allAttributesInRect! as [UICollectionViewLayoutAttributes] {
            if attributes.representedElementKind == UICollectionElementKindSectionHeader {
                
                print((self.collectionView?.contentOffset.x)!)
                
                
                // adjust section header
                attributes.frame = CGRect(x: (self.collectionView?.contentOffset.x)!, y: (self.collectionView?.frame.origin.y)!, width: (self.collectionView?.frame.width)!, height: 100)
                
            }
        }
        
        return allAttributesInRect
    }
}
