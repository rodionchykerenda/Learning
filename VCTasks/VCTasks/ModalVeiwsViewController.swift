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
    
    //MARK: - Actions
    @IBAction private func simpleAlertButtonTapped(_ sender: UIButton) {
        let signOutAction = UIAlertAction(title: "Sign Out", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        present(makeAlert(title: "Sign out?", message: "You can always access your content by signing back in", preferredStyle: .alert, actions: [signOutAction, cancelAction]), animated: true, completion: nil)
    }
    
    @IBAction private func simpleActionSheetButtonTapped(_ sender: UIButton) {
        let approveAction = UIAlertAction(title: "Approve", style: .default, handler: nil)
        let editAction = UIAlertAction(title: "Edit", style: .default, handler: nil)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
        
        present(makeAlert(title: "Title", message: "Please select an option", preferredStyle: .actionSheet, actions: [approveAction, editAction, deleteAction]), animated: true, completion: nil)
    }
    
    @IBAction private func alertWithDistractiveButtonTapped(_ sender: Any) {
        let signOutAction = UIAlertAction(title: "Sign Out", style: .destructive, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        present(makeAlert(title: "Sign out?", message: "You can always access your content by signing back in", preferredStyle: .alert, actions: [signOutAction, cancelAction]), animated: true, completion: nil)
    }
    
    @IBAction private func alertWithMoreThan2ButtonsTapped(_ sender: Any) {
        let defaultAction = UIAlertAction(title: "Default", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let destructiveAction = UIAlertAction(title: "Destructive", style: .destructive, handler: nil)
        
        present(makeAlert(title: "Alert", message: "Alert with more than 2 buttons", preferredStyle: .alert, actions: [defaultAction, cancelAction, destructiveAction]), animated: true, completion: nil)
    }
    
    @IBAction private func alertWithTextFieldButtonTapped(_ sender: Any) {
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .default, handler: nil)
        
        let alert = makeAlert(title: "Add new tag", message: nil, preferredStyle: .alert, actions: [cancelAction, addAction])
            
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

//MARK: - Helpers
private extension ModalVeiwsViewController {
    func makeAlert(title: String, message: String?, preferredStyle: UIAlertController.Style, actions: [UIAlertAction]?) -> UIAlertController {
        let resultAlert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        if let actionsArray = actions {
            actionsArray.map {
                resultAlert.addAction($0)
            }
        }
        
        return resultAlert
    }
}
