//
//  ViewController.swift
//  BaseUITasks
//
//  Created by Rodion Chikerenda on 11.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegates()
        setUpUI()
        updateSlidersValue()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var redSliderTextField: UITextField!
    @IBOutlet weak var greenSliderTextField: UITextField!
    @IBOutlet weak var blueSliderTextField: UITextField!
    
    @IBOutlet weak var resultColorView: UIView!
    
    // MARK: - Actions
    @IBAction func sliderDidTrigger(_ sender: UISlider) {
        resultColorView.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value / 255), green: CGFloat(greenSlider.value / 255), blue: CGFloat(blueSlider.value / 255), alpha: 1)
        updateTextFieldValue()
    }
    @IBAction func barButtonTapped(_ sender: Any) {
        let mainStroyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationVC = mainStroyboard.instantiateViewController(identifier: "RegistrationViewController") as? RegistrationViewController else {
            fatalError("Couldn't present view controller")
        }
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func textFieldDidEndEditing(_ sender: UITextField) {
        updateSlidersValue()
        resultColorView.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
    }
    
    // MARK: - Helpers
    func updateTextFieldValue() {
        redSliderTextField.text = String(Int(redSlider.value))
        blueSliderTextField.text = String(Int(blueSlider.value))
        greenSliderTextField.text = String(Int(greenSlider.value))
    }
    
    func updateSlidersValue() {
        redSlider.setValue(Float(String(redSliderTextField.text ?? "127")) ?? 127, animated: true)
        blueSlider.setValue(Float(String(blueSliderTextField.text ?? "127")) ?? 127, animated: true)
        greenSlider.setValue(Float(String(greenSliderTextField.text ?? "127")) ?? 127, animated: true)
    }
    
    func setUpDelegates() {
        redSliderTextField.delegate = self
        greenSliderTextField.delegate = self
        blueSliderTextField.delegate = self
    }
    
    func setUpUI() {
        redSliderTextField.text = "127"
        greenSliderTextField.text = "127"
        blueSliderTextField.text = "127"
        resultColorView.backgroundColor = UIColor(displayP3Red: 127 / 255,green: 127 / 255, blue: 127 / 255, alpha: 1)
    }
}

// MARK: - Text Field Delegate Methods
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        if updatedText == "" {
            return true
        }
        
        if let valideData = Int(updatedText) {
            if valideData > -1, valideData < 256 {
                return true
            }
        }
        
        return false
    }
}

