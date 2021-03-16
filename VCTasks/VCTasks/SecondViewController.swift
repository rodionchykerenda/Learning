//
//  SecondViewController.swift
//  VCTasks
//
//  Created by Rodion Chykerenda on 15.03.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    //MARK: - Actions
    @IBAction private func closeButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
