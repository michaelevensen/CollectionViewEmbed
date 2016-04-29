//
//  CategoryTableViewCell.swift
//  CollectionViewTest
//
//  Created by Michael Nino Evensen on 28/04/16.
//  Copyright © 2016 Michael Nino Evensen. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // pin headers
        let layout = CustomSectionHeaderFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
//        layout.minimumInteritemSpacing = 50
        layout.minimumLineSpacing = 20
        
        // set layout
        collectionView.collectionViewLayout = layout
        
        // This also works for pinning headers but they are affected by the UICollectionView as a whole with bounce etc.
//        layout.sectionHeadersPinToVisibleBounds = true
    }
    
    func setCollectionViewDataSourceDelegate <D: protocol<UICollectionViewDataSource, UICollectionViewDelegate>>(dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
}
