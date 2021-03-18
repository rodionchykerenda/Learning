//
//  DetailViewController.swift
//  CollectionsV2
//
//  Created by Rodion Chykerenda on 16.03.2021.
//

import UIKit

protocol DetailViewControllerDelegate: class {
    func detailViewController(_ sender: DetailViewController, didAdd device: DeviceModel, to section: String)
    func detailViewController(_ sender: DetailViewController, didEdit device: DeviceModel, in section: String?, to newDevice: DeviceModel)
}

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    //MARK: - Outlets
    @IBOutlet private weak var deviceImage: UIImageView!
    @IBOutlet private weak var modelTextField: UITextField!
    @IBOutlet private weak var propertiesView: UIView!
    @IBOutlet weak var infoTextView: UITextView!
    
    //MARK: - Private Properties
    private var imageTapGestureRecognizer = UITapGestureRecognizer()
    
    private var isEditingDevice = false {
        didSet {
            if oldValue {
                modelTextField.isUserInteractionEnabled = false
                infoTextView.isUserInteractionEnabled = false
                deviceImage.isUserInteractionEnabled = false
            } else {
                modelTextField.isUserInteractionEnabled = true
                infoTextView.isUserInteractionEnabled = true
                deviceImage.isUserInteractionEnabled = true
            }
        }
    }
    
    private var editButton: UIBarButtonItem?
    
    //MARK: - Public Properties
    var selectedDevice: DeviceModel?
    
    var selectedSection: String?
    
    weak var delegate: DetailViewControllerDelegate?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        styleUI()
        setUpDelegates()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

//MARK: - TextField Delegate Methods
extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

//MARK: - Helpers
private extension DetailViewController {
    func setUpUI() {
        if let device = selectedDevice {
            setUpUIForDeviceScreen(device)
        } else {
            setUpUIForAddScreen()
        }
    }
    
    func styleUI() {
        propertiesView.layer.borderWidth = 1
        propertiesView.layer.borderColor = #colorLiteral(red: 0.3882352941, green: 0.3882352941, blue: 0.4, alpha: 1)
        propertiesView.layer.masksToBounds = false
        propertiesView.layer.cornerRadius = 12
        propertiesView.clipsToBounds = true
    }
    
    func setUpUIForAddScreen() {
        imageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapOnImage(_:)))
        imageTapGestureRecognizer.delegate = self
        deviceImage.isUserInteractionEnabled = true
        deviceImage.addGestureRecognizer(imageTapGestureRecognizer)
        deviceImage.image = UIImage(named: "Unknown.pdf")
        
        addNavigationBarSaveButton()
        
        modelTextField.placeholder = "Enter model name"
    }
    
    func setUpUIForDeviceScreen(_ device: DeviceModel) {
        imageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapOnImage(_:)))
        deviceImage.addGestureRecognizer(imageTapGestureRecognizer)
        deviceImage.isUserInteractionEnabled = false
        deviceImage.image = UIImage(named: device.image ?? "Unknown.pdf")
        
        addNavigationBarSaveButton()
        addNavigationBarEditButton()
        
        modelTextField.text = device.name
        infoTextView.text = device.description
        modelTextField.isUserInteractionEnabled = false
        infoTextView.isUserInteractionEnabled = false
    }
    
    func setUpDelegates() {
        modelTextField.delegate = self
    }
    
    @objc func handleTapOnImage(_ sender: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.modalPresentationStyle = .popover
        present(imagePicker, animated: true, completion: nil)
    }
    
    func addNavigationBarSaveButton() {
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSaveButtonTap(_:)))
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    func addNavigationBarEditButton() {
        editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(handleEditButtonTap(_:)))
        self.navigationItem.rightBarButtonItems?.append(editButton!)
    }
    
    func makeRequiredFieldsAlert() {
        modelTextField.placeholder = "Required field"
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let requiredFieldsAlert = UIAlertController(title: "Not enough information added", message: "Fill all required fields before save this device", preferredStyle: .alert)
        requiredFieldsAlert.addAction(okAction)
        present(requiredFieldsAlert, animated: true, completion: nil)
    }
    
    @objc func handleSaveButtonTap(_ sender: UIButton) {
        if let modelName = modelTextField.text, modelTextField.text != "" {
            if let selectedSection = selectedSection, let _ = editButton, let selectedDevice = selectedDevice {
                delegate?.detailViewController(self, didEdit: selectedDevice, in: selectedSection, to: DeviceModel(name: modelName, description: infoTextView.text ?? "", ppi: nil, diagonal: nil, image: selectedDevice.image))
            } else if let selectedSection = selectedSection, editButton == nil {
                delegate?.detailViewController(self, didAdd: DeviceModel(name: modelName, description: infoTextView.text ?? "", ppi: nil, diagonal: nil, image: nil), to: selectedSection)
            } else if selectedSection == nil, let _ = editButton, let selectedDevice = selectedDevice {
                delegate?.detailViewController(self, didEdit: selectedDevice, in: nil, to: DeviceModel(name: modelName, description: infoTextView.text ?? "", ppi: nil, diagonal: nil, image: selectedDevice.image))
            }
            
            navigationController?.popViewController(animated: true)
        } else {
            makeRequiredFieldsAlert()
        }
    }
    
    @objc func handleEditButtonTap(_ sender: UIButton) {
        isEditingDevice = !isEditingDevice
    }
}
