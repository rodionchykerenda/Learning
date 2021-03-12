//
//  RegistrationPickerTableViewCell.swift
//  BaseUITasks
//
//  Created by Rodion Chikerenda on 11.03.2021.
//

import UIKit

class RegistrationPickerTableViewCell: UITableViewCell {
    
    var selectedModel: RegistrationCellViewModel? {
        didSet {
            styleUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var chosenOption: UILabel!
    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet weak var pickerHeightConstraint: NSLayoutConstraint!
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        chosenOption.text = String(formatter1.string(from: sender.date))
        selectedModel?.chosenOption = String(formatter1.string(from: sender.date))
    }
    
    // MARK: - Helpers
    func styleUI() {
        cellName.text = selectedModel?.name
        chosenOption.text = selectedModel?.chosenOption
        pickerHeightConstraint.constant = (selectedModel?.isExpanded ?? false) ? 100 : 0
        picker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        picker.datePickerMode = .date
        picker.maximumDate = Date()
    }
    
    func update(cellModel: RegistrationCellViewModel) {
        selectedModel = cellModel
    }
}
