//
//  ImageViewController.swift
//  Practice_Networking
//
//  Created by Rodion Chykerenda on 19.03.2021.
//  Copyright © 2021 NIX Solitions. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var downloadBar: UIProgressView!
    
    private lazy var urlSession: URLSession = {
        let config = URLSessionConfiguration.background(withIdentifier: "MySession")
        config.isDiscretionary = true
        config.sessionSendsLaunchEvents = true
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = image {
            imageView.image = image
        } else {
            downloadImage()
        }
    }
    
    private func downloadImage() {
        
        guard let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/f/ff/Pizigani_1367_Chart_10MB.jpg") else {return}
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        let backgroundTask = urlSession.downloadTask(with: url)
        backgroundTask.resume()
    }
}

extension ImageViewController: URLSessionDelegate, URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print(downloadTask.response.debugDescription)
        DispatchQueue.main.async {
            self.downloadBar.progressTintColor = .green
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        if totalBytesExpectedToWrite > 0 {
            let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
            
            DispatchQueue.main.async {
                self.downloadBar.setProgress(progress, animated: false)
            }
        }
    }
}
