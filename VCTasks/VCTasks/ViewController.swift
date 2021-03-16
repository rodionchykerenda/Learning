//
//  ViewController.swift
//  VCTasks
//
//  Created by Rodion Chykerenda on 15.03.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction private func pushVC2(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "SecondViewController")
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction private func modalVC3(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "ThirdViewController")
        destinationVC.modalPresentationStyle = .popover
        present(destinationVC, animated: true, completion: nil)
    }
//
//    @IBAction func ModalVC4(_ sender: UIButton) {
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "FourthViewController")
//        let navController = UINavigationController(rootViewController: destinationVC)
//        navController.modalPresentationStyle = .fullScreen
//        present(navController, animated: true, completion: nil)
//    }
}

