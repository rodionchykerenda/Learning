//
//  ColorViewController.swift
//  VCTasks
//
//  Created by Rodion Chykerenda on 15.03.2021.
//

import UIKit

protocol ColorViewControllerDelegate {
    func setTextField(with text: String)
}

class ColorViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet private weak var textField: UITextField!
    
    //MARK: - Public Properties
    var delegate: ColorViewControllerDelegate?
    var backgroundColor: UIColor?
    var textFieldText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        view.backgroundColor = backgroundColor
        textField.text = textFieldText
    }
}

//MARK: - TextField Delegate Methods
extension ColorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.setTextField(with: textField.text ?? "")
        
        navigationController?.popViewController(animated: true)
        
        return true
    }
}
