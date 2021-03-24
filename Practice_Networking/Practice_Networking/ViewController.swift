//
//  ViewController.swift
//  Practice_Networking
//
//  Created by anna on 8/15/19.
//  Copyright © 2019 NIX Solitions. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate, URLSessionDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print(downloadTask.response.debugDescription)
    }
    
    
    //MARK: - Private Properies
    private lazy var urlSession: URLSession = {
        let config = URLSessionConfiguration.background(withIdentifier: "MySession")
        config.isDiscretionary = true
        config.sessionSendsLaunchEvents = true
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()
    
    //MARK: - Actions
    @IBAction func tapToDownloadImageTapped(_ sender: UIButton) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = mainStoryBoard.instantiateViewController(withIdentifier: "ImageViewController")
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func allDataButtonPressed(_ sender: UIButton) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = mainStoryBoard.instantiateViewController(withIdentifier: "ListViewController")
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func getButtonTapped(_ sender: UIButton) {
        callGetRequest()
    }
    
    @IBAction func postButtonTapped(_ sender: UIButton) {
        callPostRequest()
    }
    
    @IBAction func uploadImageButtonTapped(_ sender: UIButton) {
        showImagePickerControllerActionSheet()
    }
}

//MARK: - Helpers
private extension ViewController {
    func callGetRequest() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts?_page=0&_limit=5") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let response = response, let data = data else { return }
            
            print(response)
            print(data)
            
            self.parseJSON(data: data)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            }
            catch {
                print(error)
            }
        }.resume()
    }
    
    func callPostRequest() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let userData = ["Course" : "Networking",
                        "Task" : "GET and POST reuests"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else { return }
        
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let response = response, let data = data else { return }
            
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            }
            catch {
                print(error)
            }
        }.resume()
    }
    
    func parseJSON(data: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([Model].self, from: data)
            print(decodedData)
        } catch {
            fatalError("Couldnt decode data")
        }
    }
    
    func uploadImage(image: UIImage) {
        guard let url = URL(string: "https://api.imgur.com/3/image") else { return }
        let CLIENT_ID = "5af4a79c42ea7df"
        
        let imageData = image.pngData()
        let base64Image = imageData?.base64EncodedString(options: .lineLength64Characters)

        let boundary = "Boundary-\(UUID().uuidString)"

        var request = URLRequest(url: url)
        request.addValue("Client-ID \(CLIENT_ID)", forHTTPHeaderField: "Authorization")
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"

        var body = ""
        body += "--\(boundary)\r\n"
        body += "Content-Disposition:form-data; name=\"image\""
        body += "\r\n\r\n\(base64Image ?? "")\r\n"
        body += "--\(boundary)--\r\n"
        let postData = body.data(using: .utf8)

        request.httpBody = postData

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("failed with error: \(error)")
                return
            }

            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                print("server error")
                return
            }

            if let mimeType = response.mimeType, mimeType == "application/json", let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("imgur upload results: \(dataString)")

                let parsedResult: [String: AnyObject]
                do {
                    parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]

                    if let dataJson = parsedResult["data"] as? [String: Any] {
                        print("Link is : \(dataJson["link"] as? String ?? "Link not found")")
                    }
                } catch {
                    fatalError()
                }
            }
        }.resume()
    }
}

//MARK: - ImagePickerController Delegate Methods
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showImagePickerControllerActionSheet() {
        let photoLibraryAction = UIAlertAction(title: "Choose from Library", style: .default) { (_) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }

        let cameraAction = UIAlertAction(title: "Take from Camera", style: .default) { (_) in
            self.showImagePickerController(sourceType: .camera)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        let alert = UIAlertController(title: "Please Choose An Option", message: nil, preferredStyle: .actionSheet)

        alert.addAction(cameraAction)
        alert.addAction(cancelAction)
        alert.addAction(photoLibraryAction)

        self.present(alert, animated: false, completion: nil)
    }
    
    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        uploadImage(image: image)
        dismiss(animated: false, completion: nil)
    }
}

