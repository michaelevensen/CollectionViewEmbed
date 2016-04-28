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

        return tableView.dequeueReusableCellWithIdentifier(articleReuseIdentifier, forIndexPath: indexPath) as! ArticleTableViewCell
    }

}

extension TableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
 
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CategoryCollectionViewCell", forIndexPath: indexPath) as! CategoryCollectionViewCell
        
        cell.titleLabel.text = "This is a cell"
        
        return cell
    }
}