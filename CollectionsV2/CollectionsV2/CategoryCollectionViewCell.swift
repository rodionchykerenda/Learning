//
//  CategoryCollectionViewCell.swift
//  CollectionsV2
//
//  Created by Rodion Chykerenda on 18.03.2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    //MARK: - Outlets
    @IBOutlet private weak var deviceImage: UIImageView!
    @IBOutlet private weak var modelNameLabel: UILabel!
    
    func update(device: DeviceModel) {
        modelNameLabel.text = device.name
        deviceImage.image = UIImage(named: device.image ?? "Unknown.pdf")
    }
}
