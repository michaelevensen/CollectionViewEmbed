//
//  CategorySectionReusableView.swift
//  CollectionViewTest
//
//  Created by Michael Nino Evensen on 28/04/16.
//  Copyright © 2016 Michael Nino Evensen. All rights reserved.
//

import UIKit

class CategorySectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
