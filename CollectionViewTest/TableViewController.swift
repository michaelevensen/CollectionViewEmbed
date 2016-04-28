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

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // register collectionview nib
//        let nib = UINib(nibName: categoryReuseIdentifier, bundle: nil)
//        tableView.registerNib(nib, forCellReuseIdentifier: categoryReuseIdentifier)
       
        // register article nibs
        let article = UINib(nibName: articleReuseIdentifier, bundle: nil)
        tableView.registerNib(article, forCellReuseIdentifier: articleReuseIdentifier)
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let tableViewCell = cell as? CategoryTableViewCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
//        if indexPath.row==0 {
//            return 350
//        }
        
        return 120 // cell height
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if indexPath.row==0 {
            return tableView.dequeueReusableCellWithIdentifier(categoryReuseIdentifier, forIndexPath: indexPath) as! CategoryTableViewCell
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(articleReuseIdentifier, forIndexPath: indexPath) as! ArticleTableViewCell
        
        return cell
    }


}

extension TableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
 
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CategoryCollectionViewCell", forIndexPath: indexPath)
        
        return cell
    }
}