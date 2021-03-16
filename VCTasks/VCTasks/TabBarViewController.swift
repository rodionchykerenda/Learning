//
//  TabBarViewController.swift
//  VCTasks
//
//  Created by Rodion Chykerenda on 15.03.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "ViewController")
        
        let vc1 = UINavigationController(rootViewController: destinationVC)
        vc1.title = "Task1VC1"
        
        let destinationVC2 = mainStoryboard.instantiateViewController(withIdentifier: "FourthViewController")
        
        let vc2 = UINavigationController(rootViewController: destinationVC2)
        vc2.title = "Task1VC4"
        
        let task2Storyboard = UIStoryboard(name: "Task2", bundle: nil)
        let destinationVC3 = task2Storyboard.instantiateViewController(withIdentifier: "InputTextViewController")
        
        let vc3 = UINavigationController(rootViewController: destinationVC3)
        vc3.title = "Task2"
        
        let task4Storyboard = UIStoryboard(name: "Task4", bundle: nil)
        let destinationVC4 = task4Storyboard.instantiateViewController(withIdentifier: "ModalVeiwsViewController")
        
        let vc4 = UINavigationController(rootViewController: destinationVC4)
        vc4.title = "Task4"
        
        self.setViewControllers([vc1 ,vc2, vc3, vc4], animated: true)
    }
}
