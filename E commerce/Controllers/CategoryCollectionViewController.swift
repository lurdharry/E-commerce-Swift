//
//  CategoryCollectionViewController.swift
//  E commerce
//
//  Created by Hammed on 17/02/2023.
//

import UIKit

private let reuseIdentifier = "categoryCell"

class CategoryCollectionViewController: UICollectionViewController {
    
    
   //MARK: vars
    var categoryArray : [Category] = []

    //MARK: lifecyccle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        loadCategories()
//    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return categoryArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
        return cell
    }

    
    //MARK: Download categories
    private func loadCategories(){
        downloadCategories { categoryArray in
            self.categoryArray = categoryArray
            self.collectionView.reloadData()
        }
    }
}
