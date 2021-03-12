//
//  RegistrationTableViewCell.swift
//  BaseUITasks
//
//  Created by Rodion Chikerenda on 11.03.2021.
//

import UIKit

class GenderTableViewCell: UITableViewCell {
    
    var selectedModel: RegistrationCellViewModel? {
        didSet {
            styleUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpDelegates()
    }
    
    var genderPickerDataSource = ["Unknown", "Male", "Female"]
    
    // MARK: - Outlets
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var chosenOption: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var pickerHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Helpers
    func styleUI() {
        cellName.text = selectedModel?.name
        pickerHeightConstraint.constant = (selectedModel?.isExpanded ?? false) ? 100 : 0
        chosenOption.text = selectedModel?.chosenOption
    }
    
    func update(cellModel: RegistrationCellViewModel) {
        selectedModel = cellModel
    }
    
    func setUpDelegates() {
        picker.delegate = self
        picker.dataSource = self
    }
}

// MARK: - PickerView DataSource, Delegate
extension GenderTableViewCell: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderPickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenOption.text = genderPickerDataSource[row]
        selectedModel?.chosenOption = genderPickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderPickerDataSource[row]
    }
}
