//
//  DeviceModel.swift
//  CollectionsV2
//
//  Created by Rodion Chykerenda on 17.03.2021.
//

import Foundation

struct DeviceModel: Equatable {
    var name: String
    var description: String
    var ppi: Int?
    var diagonal: Double?
    var image: String?
}
