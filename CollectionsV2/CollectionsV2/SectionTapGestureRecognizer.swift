//
//  SectionTapGestureRecognizer.swift
//  CollectionsV2
//
//  Created by Rodion Chykerenda on 17.03.2021.
//

import UIKit

class SectionTapGestureRecognizer: UITapGestureRecognizer {

    let sectionSelected: Int
    init(target: AnyObject, action: Selector, section: Int) {
        self.sectionSelected = section
        super.init(target: target, action: action)
    }
}
