//
//  ColorViewController.swift
//  VCTasks
//
//  Created by Rodion Chykerenda on 15.03.2021.
//

import UIKit

protocol ColorViewControllerDelegate {
    func textFieldDidEditText(with text: String)
}

class ColorViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet private weak var textField: UITextField!
    
    //MARK: - Public Properties
    var colorViewControllerDelegate: ColorViewControllerDelegate?
    var backgroundColor: UIColor?
    var textFieldText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegates()
        styleUI()
    }
}

//MARK: - TextField Delegate Methods
extension ColorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        colorViewControllerDelegate?.textFieldDidEditText(with: textField.text ?? "")
        
        navigationController?.popViewController(animated: true)
        
        return true
    }
}

//MARK: - Helpers
private extension ColorViewController {
    func setUpDelegates() {
        textField.delegate = self
    }
    
    func styleUI() {
        view.backgroundColor = backgroundColor
        textField.text = textFieldText
    }
}
