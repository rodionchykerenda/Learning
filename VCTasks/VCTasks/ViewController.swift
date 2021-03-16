//
//  ViewController.swift
//  VCTasks
//
//  Created by Rodion Chykerenda on 15.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Actions
    @IBAction private func pushVC2(_ sender: UIButton) {
        let mainStoryboard = getMainStoryboard()
        let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "SecondViewController")
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction private func modalVC3(_ sender: UIButton) {
        let mainStoryboard = getMainStoryboard()
        let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "ThirdViewController")
        destinationVC.modalPresentationStyle = .popover
        present(destinationVC, animated: true, completion: nil)
    }
    
    //MARK: - Helpers
    private func getMainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}

