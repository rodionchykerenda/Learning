//
//  RegistrationCellViewModel.swift
//  BaseUITasks
//
//  Created by Rodion Chikerenda on 11.03.2021.
//

import Foundation

class RegistrationCellViewModel {
    var name: String
    var isExpanded: Bool = false
    var chosenOption: String = ""
    
    init(name: String) {
        self.name = name
    }
}
