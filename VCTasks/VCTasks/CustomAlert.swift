//
//  CustomAlert.swift
//  VCTasks
//
//  Created by Rodion Chykerenda on 16.03.2021.
//

import UIKit

class CustomAlert {
    private let backgroundAlphaTo: CGFloat = 0.6
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0
        
        return backgroundView
    }()
    
    private let alertView: UIView = {
       let alert = UIView()
        alert.backgroundColor = .white
        
        return alert
    }()
    
    private var myTargetView: UIView?
    
    func showAlert(with title: String,
                   message: String,
                   on viewController: UIViewController) {
        guard let targetView = viewController.view else {
            return
        }
        
        myTargetView = targetView
        
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        
        targetView.addSubview(alertView)
        
        alertView.isUserInteractionEnabled = true
        alertView.frame = CGRect(x: 0, y: 0, width: targetView.frame.size.width - 90, height: 300)
        alertView.center = targetView.center
        alertView.layer.borderWidth = 1
        alertView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: alertView.frame.size.width, height: 80))
        
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        titleLabel.textAlignment = .center
        alertView.addSubview(titleLabel)
        
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 80, width: alertView.frame.size.width, height: 170))
        
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.textColor = .white
        messageLabel.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        alertView.addSubview(messageLabel)
        
        let button = UIButton(frame: CGRect(x: 0, y: alertView.frame.size.height - 50, width: alertView.frame.size.width, height: 50))
        
        button.setTitle("OK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        alertView.addSubview(button)
        button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        
        UIView.animate(withDuration: 0.25) {
            self.backgroundView.alpha = self.backgroundAlphaTo
        }
    }
    
    @objc func dismissAlert() {
        guard let _ = myTargetView else {
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            self.backgroundView.alpha = 0
            self.alertView.removeFromSuperview()
            self.backgroundView.removeFromSuperview()
        }
    }
}
