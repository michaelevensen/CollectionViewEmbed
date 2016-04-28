//
//  TableViewController.swift
//  CollectionViewTest
//
//  Created by Michael Nino Evensen on 28/04/16.
//  Copyright © 2016 Michael Nino Evensen. All rights reserved.
//

import UIKit

let articleReuseIdentifier = "articleCell"
let categoryReuseIdentifier = "categoryCell"

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // register collectionview nib
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "CollectionViewCell")
       
    }

    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let tableViewCell = cell as? CategoryTableViewCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
//        if indexPath.row==0 {
//            return 350
//        }
//        
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
        
        // switch between two different types of cells
//        let identifier = indexPath.row==0 ? articleReuseIdentifier : categoryReuseIdentifier
        
        let cell = tableView.dequeueReusableCellWithIdentifier(articleReuseIdentifier, forIndexPath: indexPath) as! ArticleTableViewCell
        
        return cell
    }


}

extension TableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
 
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath)
        
        return cell
    }
}