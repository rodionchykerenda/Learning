//
//  ModalVeiwsViewController.swift
//  VCTasks
//
//  Created by Rodion Chykerenda on 15.03.2021.
//

import UIKit

class ModalVeiwsViewController: UIViewController {
    
    //MARK: - Properties
    private var customAlert = CustomAlert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction private func simpleAlertButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Sign out?", message: "You can always access your content by signing back in", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Sign Out", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction private func simpleActionSheetButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Title", message: "Please select an option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Approve", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction private func alertWithDistractiveButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Sign out?", message: "You can always access your content by signing back in", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction private func alertWithMoreThan2ButtonsTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "Alert with more than 2 buttons", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Default", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Destructive", style: .destructive, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction private func alertWithTextFieldButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add new tag", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input your name here..."
        })
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction private func shreTextButtonTapped(_ sender: Any) {
        let activity = UIActivityViewController(activityItems: ["Text"], applicationActivities: nil)
        
        present(activity, animated: true, completion: nil)
    }
    
    @IBAction private func shareImageButtonTapped(_ sender: Any) {
        let activity = UIActivityViewController(activityItems: [UIImage(named: "someImage")], applicationActivities: nil)
        
        present(activity, animated: true, completion: nil)
    }
    
    @IBAction func customAlertButtonPressed(_ sender: Any) {
        customAlert.showAlert(with: "Title", message: "Message", on: self)
    }
    
    @objc func dismissAlert() {
        customAlert.dismissAlert()
    }
}
