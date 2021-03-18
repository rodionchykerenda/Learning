//
//  CategoryTableViewCell.swift
//  CollectionsV2
//
//  Created by Rodion Chykerenda on 18.03.2021.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet private weak var categoryNameLabel: UILabel!
    @IBOutlet private weak var contentCollectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        contentCollectionView.delegate = dataSourceDelegate
        contentCollectionView.dataSource = dataSourceDelegate
        contentCollectionView.tag = row
        contentCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        contentCollectionView.reloadData()
    }
    
    func update(name: String) {
        categoryNameLabel.text = name
    }
}
