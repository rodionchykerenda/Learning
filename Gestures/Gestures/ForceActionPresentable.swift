//
//  ForceActionPresentable.swift
//  Gestures
//
//  Created by Rodion Chikerenda on 15.03.2021.
//

import UIKit

protocol ForceActionPresentable: class {
    var forceGestureRecognizer: ForceTouchGestureRecognizer? { get set }
}
