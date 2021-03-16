//
//  InputTextViewController.swift
//  VCTasks
//
//  Created by Rodion Chykerenda on 15.03.2021.
//

import UIKit

class InputTextViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet private weak var textField: UITextField!
    
    //MARK: - Public Properties
    var textFieldText: String?
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = textFieldText
    }
    
    //MARK: - Actions
    @IBAction private func pushButtonTapped(_ sender: UIButton) {
        let taskStoryboard = UIStoryboard(name: "Task2", bundle: nil)
        
        guard let destinationVC = taskStoryboard.instantiateViewController(withIdentifier: "ColorViewController") as? ColorViewController else { return }
        
        destinationVC.backgroundColor = sender.backgroundColor
        destinationVC.textFieldText = textField.text
        destinationVC.colorViewControllerDelegate = self
        
        textField.resignFirstResponder()
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

//MARK: - ColorViewController Delegate Methods
extension InputTextViewController: ColorViewControllerDelegate {
    func textFieldDidEditText(with text: String) {
        textField.text = text
    }
}
