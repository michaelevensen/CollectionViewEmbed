//
//  TableViewController.swift
//  CollectionViewTest
//
//  Created by Michael Nino Evensen on 28/04/16.
//  Copyright © 2016 Michael Nino Evensen. All rights reserved.
//

import UIKit

let articleReuseIdentifier = "ArticleTableViewCell"
let categoryReuseIdentifier = "CategoryTableViewCell"

class TableViewController: UITableViewController {
    
    // maximum number of featured articles
    let featuredArticlesNum = 8

    // category count
    let categoryNum = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? CategoryTableViewCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: (indexPath as NSIndexPath).row)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // category cell height
        if (indexPath as NSIndexPath).section == 1 {
           return 500
        }
        
        // featured article cell height
        return 120
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==1 {
            return categoryNum
        }
        
        return featuredArticlesNum
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // categories
        if (indexPath as NSIndexPath).section==1 {
            return tableView.dequeueReusableCell(withIdentifier: categoryReuseIdentifier, for: indexPath) as! CategoryTableViewCell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: articleReuseIdentifier, for: indexPath) as! ArticleTableViewCell
        
        cell.titleLabel.text = "Article Cell"
        
        return cell
    }

}

extension TableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.featuredArticlesNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.titleLabel.text = "Category Article Cell"
        
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//        let sideMargin:CGFloat = 25
//        
//        // needed to place sectionheader on top
//        return UIEdgeInsetsMake(sideMargin, -collectionView.frame.width+sideMargin, 0, sideMargin)
//    }
    
    // size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 400)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let categoryHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CategoryCollectionViewHeader", for: indexPath) as! CategorySectionHeaderView
        
        categoryHeader.categoryLabel.text = "Category Section Header Label"
        
        
        return categoryHeader
    }
}
