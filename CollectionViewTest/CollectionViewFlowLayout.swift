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
        
        var attributesArray = super.layoutAttributesForElementsInRect(rect)
        
        
         print((self.collectionView?.contentOffset.x)!)
        
        // keep track of when header is visible
        var headerVisible = false
        
        for attributes in attributesArray! as [UICollectionViewLayoutAttributes] {
            
            if attributes.representedElementKind == UICollectionElementKindSectionHeader {
                
                headerVisible = true
                
                // adjust section header
                
                attributes.frame.origin = CGPoint(x: (self.collectionView?.contentOffset.x)!, y: (self.collectionView?.frame.origin.y)!)
                attributes.zIndex = 2
 
//                attributes.frame = CGRect(x: (self.collectionView?.contentOffset.x)!, y: (self.collectionView?.frame.origin.y)!, width: (self.collectionView?.frame.width)!-50, height: 50)
                
            }
        }
        
        if !headerVisible {
            let attributes:UICollectionViewLayoutAttributes = self.layoutAttributesForSupplementaryViewOfKind(UICollectionElementKindSectionHeader, atIndexPath: NSIndexPath(forItem: 0, inSection: 0))!
            
            attributesArray?.append(attributes)
        
        }
        
        return attributesArray
    }
}
