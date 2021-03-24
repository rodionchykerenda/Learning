//
//  ViewController.swift
//  CollectionsV2
//
//  Created by Rodion Chykerenda on 16.03.2021.
//

import UIKit

class FirstViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var contentTableView: UITableView!
    
    //MARK: - Private Properties
    private var dataSource: [DeviceModel] = DeviceManager.makeAllDevicesModelArray() {
        didSet {
            contentTableView.reloadData()
        }
    }
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDelegates()
        nameViewController()
    }
}

//MARK: - TableView Delegate And DataSource Methods
extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DeviceTableViewCell.identifier, for: indexPath) as? DeviceTableViewCell else { fatalError("Couldn't dequeue reusable cell") }
        
        cell.update(device: dataSource[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detailsViewController.delegate = self
        detailsViewController.selectedDevice = dataSource[indexPath.row]
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

//MARK: - Helpers
private extension FirstViewController {
    func setUpDelegates() {
        contentTableView.delegate = self
        contentTableView.dataSource = self
        contentTableView.register(UINib(nibName: DeviceTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DeviceTableViewCell.identifier)
    }
    
    func nameViewController() {
        self.title = "Devices"
    }
}

//MARK: - DetailViewController Delegate Mehods
extension FirstViewController: DetailViewControllerDelegate {
    func detailViewController(_ sender: DetailViewController, didEdit device: DeviceModel, in section: String?, to newDevice: DeviceModel) {
        if let index = dataSource.firstIndex(of: device) {
                    dataSource[index] = newDevice
        }
            
            contentTableView.reloadData()
    }
    
    func detailViewController(_ sender: DetailViewController, didAdd device: DeviceModel, to section: String) {
    }
}

