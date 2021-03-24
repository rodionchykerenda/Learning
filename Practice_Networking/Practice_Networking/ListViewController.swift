//
//  ListViewController.swift
//  Practice_Networking
//
//  Created by Rodion Chykerenda on 19.03.2021.
//  Copyright © 2021 NIX Solitions. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var contentTableView: UITableView!
    
    //MARK: - Private Properties
    private var dataSource = [Model]()
    private var pageNumber = 2
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDelegates()
        setUpDataSource()
        configureRefreshControl()
    }
}

//MARK: - TableView DataSource And Delegate Methods
extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == dataSource.count - 1 {
            let indicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            indicatorView.startAnimating()
            contentTableView.tableFooterView?.isHidden = false
            contentTableView.tableFooterView = indicatorView
            
            var networkManager = NetworkManager()
            networkManager.delegate = self
            networkManager.loadData(pageNumber: pageNumber)
        }
    }
}

//MARK: - Helpers
private extension ListViewController {
    func setUpDataSource() {
        var networkManager = NetworkManager()
        networkManager.delegate = self
        networkManager.loadData()
    }
    
    func setUpDelegates() {
        contentTableView.delegate = self
        contentTableView.dataSource = self
    }
    
    func configureRefreshControl () {
        contentTableView.refreshControl = UIRefreshControl()
        contentTableView.refreshControl?.addTarget(self, action:
                                                    #selector(handleRefreshControl),
                                                   for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        setUpDataSource()
        
        DispatchQueue.main.async {
            self.contentTableView.refreshControl?.endRefreshing()
        }
    }
    
}

//MARK: - NetworkManager Delegate Methods
extension ListViewController: NetworkManagerDelegate {
    func networkManagerDelegate(_ sender: NetworkManager, didFailWithError error: Error) {
        fatalError("\(error)")
    }
    
    func networkManagerDelegate(_ sender: NetworkManager, didFinishLoading items: [Model]) {
        DispatchQueue.main.async {
            self.dataSource = items
            self.contentTableView.reloadData()
        }
    }
    
    func networkManagerDelegate(_ sender: NetworkManager, didFinishLoadingMore items: [Model]) {
        let startAmount = dataSource.count
        dataSource.append(contentsOf: items)
        var indexPathes: [IndexPath] = []
        let amountOfNewCells = dataSource.count - startAmount
        
        for i in 0..<amountOfNewCells {
            indexPathes.append(IndexPath(row: startAmount + i, section: 0))
        }
        
        print("Loaded")
        
        DispatchQueue.main.async {
            let currentOffset = self.contentTableView.contentOffset.y
            self.contentTableView.tableFooterView?.isHidden = true
            self.contentTableView.tableFooterView = nil
            self.contentTableView.beginUpdates()
            self.contentTableView.insertRows(at: indexPathes, with: .automatic)
            self.contentTableView.endUpdates()
            self.contentTableView.setContentOffset(CGPoint(x: 0, y: currentOffset), animated: false)
        }
    }
}
