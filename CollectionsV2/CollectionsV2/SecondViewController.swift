//
//  SecondViewController.swift
//  CollectionsV2
//
//  Created by Rodion Chykerenda on 16.03.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var contentTableView: UITableView!
    
    //MARK: - Private Properties
    private var dataSource = [SectionViewModel(data: DeviceManager.makeIphoneModelArray(), name: "iPhone"), SectionViewModel(data: DeviceManager.makeIpadModelArray(), name: "iPad")]
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDelegates()
        setUpTableView()
        self.title = "Devices"
    }
}

//MARK: - TableView Delegate And DataSource Methods
extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !dataSource[section].isExpanded {
            return 0
        }
        return dataSource[section].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DeviceTableViewCell.identifier, for: indexPath) as? DeviceTableViewCell else { fatalError("Couldn't dequeue reusable cell") }
        
        cell.update(device: dataSource[indexPath.section].data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return setUpSection(tableView, name: dataSource[section].name, section: section)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detailsViewController.delegate = self
        detailsViewController.selectedSection = dataSource[indexPath.section].name
        detailsViewController.selectedDevice = dataSource[indexPath.section].data[indexPath.row]
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .white
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            guard dataSource[indexPath.section].data.count > 1 else {
                tableView.beginUpdates()
                dataSource.remove(at: indexPath.section)
                tableView.deleteSections([indexPath.section], with: .fade)
                tableView.endUpdates()
                return
            }
            
            dataSource[indexPath.section].data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}

//MARK: - Helpers
private extension SecondViewController {
    func setUpDelegates() {
        contentTableView.delegate = self
        contentTableView.dataSource = self
    }
    
    func setUpTableView() {
        contentTableView.estimatedRowHeight = 100
        contentTableView.rowHeight = UITableView.automaticDimension
        contentTableView.register(UINib(nibName: DeviceTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DeviceTableViewCell.identifier)
    }
    
    func setUpSection(_ tableView: UITableView, name: String, section: Int) -> UIView? {
        let viewForHeader = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width - 20, height: 50))
        let sectionNameLabel = UILabel(frame: CGRect(x: 20, y: 10, width: viewForHeader.frame.size.width - 40, height: viewForHeader.frame.size.height - 20))
        let addButton = UIButton(frame: CGRect(x: viewForHeader.frame.size.width - 40, y: 10, width: 40, height: viewForHeader.frame.size.height - 20))
        
        sectionNameLabel.text = name
        sectionNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        viewForHeader.addSubview(sectionNameLabel)
        
        viewForHeader.isUserInteractionEnabled = true
        let tapGestureRecognizer = SectionTapGestureRecognizer(target: self, action: #selector(handleTapOnSection(_:)), section: section)
        viewForHeader.addGestureRecognizer(tapGestureRecognizer)
        
        addButton.addTarget(self, action: #selector(handleAddButtonPress(_:)), for: .touchUpInside)
        addButton.setTitle("Add", for: .normal)
        addButton.tag = section
        addButton.setTitleColor(.link, for: .normal)
        viewForHeader.addSubview(addButton)
        
        styleSectionView(viewForHeader)
        
        return viewForHeader
    }
    
    func styleSectionView(_ view: UIView) {
        view.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.9333333333, blue: 0.968627451, alpha: 1)
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    @objc func handleTapOnSection(_ tapGestureRecognizer: SectionTapGestureRecognizer) {
        let section = tapGestureRecognizer.sectionSelected
        var indexPathArray = [IndexPath]()
        
        for row in dataSource[section].data.indices {
            let indexPathToChange = IndexPath(row: row, section: section)
            indexPathArray.append(indexPathToChange)
        }
        
        let isExpanded = dataSource[section].isExpanded
        dataSource[section].isExpanded = !isExpanded
        
        if isExpanded {
            contentTableView.deleteRows(at: indexPathArray, with: .fade)
        } else {
            contentTableView.insertRows(at: indexPathArray, with: .fade)
        }
    }
    
    @objc func handleAddButtonPress(_ sender: UIButton) {
        let detailsViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detailsViewController.selectedSection = dataSource[sender.tag].name
        detailsViewController.delegate = self
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

//MARK: - DetailViewController Delegate Methods
extension SecondViewController: DetailViewControllerDelegate {
    func detailViewController(_ sender: DetailViewController, didEdit device: DeviceModel, in section: String?, to newDevice: DeviceModel) {
        if section == "iPhone" {
            if let index = dataSource[0].data.firstIndex(of: device) {
                dataSource[0].data[index] = newDevice
            }
        } else if let index = dataSource[1].data.firstIndex(of: device) {
            dataSource[1].data[index] = newDevice
        }
        
        contentTableView.reloadData()
    }
    
    func detailViewController(_ sender: DetailViewController, didAdd device: DeviceModel, to section: String) {
        if section == "iPhone" {
            dataSource[0].data.append(device)
        } else if section == "iPad" {
            dataSource[1].data.append(device)
        }
        
        contentTableView.reloadData()
    }
}
