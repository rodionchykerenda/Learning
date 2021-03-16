//
//  FifthViewController.swift
//  VCTasks
//
//  Created by Rodion Chykerenda on 15.03.2021.
//

import UIKit

class FifthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction private func closeButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
