//
//  CustomSectionHeaderFlowLayout.swift
//  CollectionViewTest
//
//  Created by Michael Nino Evensen on 29/04/16.
//  Copyright © 2016 Michael Nino Evensen. All rights reserved.
//

import UIKit

class CustomSectionHeaderFlowLayout: UICollectionViewFlowLayout {

//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        self.scrollDirection = UICollectionViewScrollDirection.Horizontal
//        
//        //        self.headerReferenceSize = CGSize(width: 50, height: 50)
//        //        self.minimumInteritemSpacing = 0
//        //        self.minimumLineSpacing = 0
//        //        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
//    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var allAttributes = super.layoutAttributesForElementsInRect(rect)!
        
        // re-add the header when disappearing
        var headerIsVisible = false
        
        // iterate
        for obj in allAttributes {
            
            if obj.representedElementKind == UICollectionElementKindSectionHeader {
                obj.frame.origin.x = (self.collectionView?.contentOffset.x)!
                
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
        
        if elementKind == UICollectionElementKindSectionHeader {
            attributes.frame.origin.x = (self.collectionView?.contentOffset.x)!
        }
        
        return attributes
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
//    func updateHeaderAttributes(attributes: UICollectionViewLayoutAttributes) {
//        
//        attributes.zIndex = 1
//        attributes.hidden = false
//        attributes.center = CGPoint(x: 0, y: 0)
//        
//    }
    
}
