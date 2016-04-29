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
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let tableViewCell = cell as? CategoryTableViewCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        // category cell height
        if indexPath.section == 1 {
           return 350
        }
        
        // featured article cell height
        return 120
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==1 {
            return categoryNum
        }
        
        return featuredArticlesNum
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // categories
        if indexPath.section==1 {
            return tableView.dequeueReusableCellWithIdentifier(categoryReuseIdentifier, forIndexPath: indexPath) as! CategoryTableViewCell
        }

        let cell = tableView.dequeueReusableCellWithIdentifier(articleReuseIdentifier, forIndexPath: indexPath) as! ArticleTableViewCell
        
        cell.titleLabel.text = "Article Cell"
        
        return cell
    }

}

extension TableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CategoryCollectionViewCell", forIndexPath: indexPath) as! CategoryCollectionViewCell
        
        cell.titleLabel.text = "Category Article Cell"
        
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let sideMargin:CGFloat = 25
        
        // needed to place sectionheader on top
        return UIEdgeInsetsMake(0, -collectionView.frame.width+sideMargin, 0, sideMargin)
    }
    
    // size
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 300, height: 200)
    }

    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let categoryHeader = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "CategoryCollectionViewHeader", forIndexPath: indexPath) as! CategorySectionReusableView
        
        categoryHeader.categoryLabel.text = "Category Label"
        
        
        return categoryHeader
    }
}