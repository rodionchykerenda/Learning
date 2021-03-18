//
//  DeviceTableViewCell.swift
//  CollectionsV2
//
//  Created by Rodion Chykerenda on 16.03.2021.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ppiAndDiagonalLabel: UILabel!
    @IBOutlet private weak var deviceImage: UIImageView!
    
    //MARK: - Public Properties
    static let identifier = "DeviceTableViewCell"
    
    //MARK: - Setters
    func update(device: DeviceModel) {
        nameLabel.text = device.name
        ppiAndDiagonalLabel.text = device.description
        deviceImage.image = UIImage(named: device.image ?? "Unknown.pdf")
    }
}
