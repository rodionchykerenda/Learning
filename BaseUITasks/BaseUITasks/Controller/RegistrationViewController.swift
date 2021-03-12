//
//  RegistrationViewController.swift
//  BaseUITasks
//
//  Created by Rodion Chikerenda on 11.03.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    var dataSource: [RegistrationCellViewModel] = [RegistrationCellViewModel(name: "Gender"), RegistrationCellViewModel(name: "Date Of Birth")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegates()
        styleUI()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var contentTableView: UITableView!
    
    // MARK: - Helpers
    func setUpDelegates() {
        contentTableView.delegate = self
        contentTableView.dataSource = self
        contentTableView.register(UINib(nibName: "GenderTableViewCell", bundle: nil), forCellReuseIdentifier: "GenderTableViewCell")
        contentTableView.register(UINib(nibName: "DateOfBirthTableViewCell", bundle: nil), forCellReuseIdentifier: "DateOfBirthTableViewCell")
    }
    
    func styleUI() {
        avatarImageView.image = #imageLiteral(resourceName: "Avatar")
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        avatarImageView.clipsToBounds = true
    }
}

// MARK: - TableView Delegate DataSource Methods
extension RegistrationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GenderTableViewCell", for: indexPath) as? GenderTableViewCell else { fatalError("Couldn't dequeue reusable cell") }
            cell.update(cellModel: dataSource[indexPath.row])
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DateOfBirthTableViewCell", for: indexPath) as? DateOfBirthTableViewCell else { fatalError("Couldn't dequeue reusable cell") }
            cell.update(cellModel: dataSource[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSource[indexPath.row].isExpanded = dataSource[indexPath.row].isExpanded ? false : true
        contentTableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.fade)
    }
}
