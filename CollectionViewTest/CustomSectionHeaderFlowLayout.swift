//
//  CustomSectionHeaderFlowLayout.swift
//  CollectionViewTest
//
//  Created by Michael Nino Evensen on 29/04/16.
//  Copyright © 2016 Michael Nino Evensen. All rights reserved.
//

import UIKit

class CustomSectionHeaderFlowLayout: UICollectionViewFlowLayout {
   
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var allAttributes = super.layoutAttributesForElements(in: rect)!
        
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
            let header = self.layoutAttributesForSupplementaryView(ofKind: UICollectionElementKindSectionHeader, at: IndexPath(item: allAttributes.count, section: 0))
            
            allAttributes.append(header!)
        }
        
        return allAttributes
        
    }
    
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {

        let attributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, with: indexPath)
        attributes.size = CGSize(width: (self.collectionView?.bounds.size.width)!, height: 50)
        
        // set origin
        if elementKind == UICollectionElementKindSectionHeader {
            self.updateHeaderAttributes(attributes)
        }
        
        return attributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    // MARK - Stick Header to Top Left
    func updateHeaderAttributes(_ attributes: UICollectionViewLayoutAttributes) {
        
        // update frame
        attributes.frame = CGRect(origin: CGPoint(x: (self.collectionView?.contentOffset.x)!, y: 0), size: attributes.size)
    }
    
}
