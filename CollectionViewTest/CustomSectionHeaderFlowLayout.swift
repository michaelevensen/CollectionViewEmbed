//
//  CustomSectionHeaderFlowLayout.swift
//  CollectionViewTest
//
//  Created by Michael Nino Evensen on 29/04/16.
//  Copyright © 2016 Michael Nino Evensen. All rights reserved.
//

import UIKit

class CustomSectionHeaderFlowLayout: UICollectionViewFlowLayout {
   
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var allAttributes = super.layoutAttributesForElementsInRect(rect)!
        
        // re-add the header when disappearing
        var headerIsVisible = false
        
        // iterate
        for attributes in allAttributes {
            
            if attributes.representedElementKind == UICollectionElementKindSectionHeader {
                
                // update header
                self.updateHeaderAttributes(attributes)
                
                headerIsVisible = true
            }
        }
        
        // Flow layout will remove items from the list if they are supposed to be off screen, so we add them
        // back in in those cases.
        if !headerIsVisible {
            let header = self.layoutAttributesForSupplementaryViewOfKind(UICollectionElementKindSectionHeader, atIndexPath: NSIndexPath(forItem: allAttributes.count, inSection: 0))
            
            allAttributes.append(header!)
        }
        
        return allAttributes
        
    }
    
    override func layoutAttributesForSupplementaryViewOfKind(elementKind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {

        let attributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, withIndexPath: indexPath)
        attributes.size = CGSize(width: (self.collectionView?.bounds.size.width)!, height: 50)
        
        // set origin
        if elementKind == UICollectionElementKindSectionHeader {
            self.updateHeaderAttributes(attributes)
        }
        
        return attributes
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    // MARK - Stick Header to Top Left
    func updateHeaderAttributes(attributes: UICollectionViewLayoutAttributes) {
        
        // update frame
        attributes.frame = CGRect(origin: CGPoint(x: (self.collectionView?.contentOffset.x)!, y: 0), size: attributes.size)
    }
    
}
