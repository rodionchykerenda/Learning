//
//  NetworkManager.swift
//  Practice_Networking
//
//  Created by Rodion Chykerenda on 19.03.2021.
//  Copyright © 2021 NIX Solitions. All rights reserved.
//

import Foundation

protocol NetworkManagerDelegate: class {
    func networkManagerDelegate(_ sender: NetworkManager, didFinishLoading items: [Model])
    func networkManagerDelegate(_ sender: NetworkManager, didFinishLoadingMore items: [Model])
    func networkManagerDelegate(_ sender: NetworkManager, didFailWithError error: Error)
}

struct NetworkManager {
    
    weak var delegate: NetworkManagerDelegate?
    
    func loadData(pageNumber: Int = 1) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts?_page=\(pageNumber)&_limit=5") else { return }
        
        var models = [Model]()
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode([Model].self, from: data)
                models = decodedData
            } catch {
                delegate?.networkManagerDelegate(self, didFailWithError: error)
            }
            
            if pageNumber == 1 {
                self.delegate?.networkManagerDelegate(self, didFinishLoading: models)
            } else {
                self.delegate?.networkManagerDelegate(self, didFinishLoadingMore: models)
            }
        }.resume()
    }
}
