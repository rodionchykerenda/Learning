//
//  FourthViewController.swift
//  VCTasks
//
//  Created by Rodion Chykerenda on 15.03.2021.
//

import UIKit

class FourthViewController: UIViewController {
    
    //MARK: - Actions
    @IBAction private func pushVC5Tapped(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "FifthViewController")
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction private func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
