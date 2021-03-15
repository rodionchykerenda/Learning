//
//  ViewController.swift
//  Gestures
//
//  Created by Rodion Chikerenda on 12.03.2021.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate, ForceActionPresentable {
    
    // MARK: - Outlets
    @IBOutlet weak var redView: UIView!
    
    // MARK: - Public Properties
    
    var forceGestureRecognizer: ForceTouchGestureRecognizer?
    
    // MARK: - Private Properties
    private let panGestureRecognizer = UIPanGestureRecognizer()
    
    private let rotateGestureRecognizer = UIRotationGestureRecognizer()
    
    private let pinchGestureRecognizer = UIPinchGestureRecognizer()
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    // MARK: - VC Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.isUserInteractionEnabled = true
        redView.isMultipleTouchEnabled = true
        
        setUpPanGestureRecognizer()
        setUpPinchGestureRecognizer()
        setUpRotateGestureRecognizer()
        setUpTapGestureRecognizer()
        setUpForceGestureRecognizer()
    }
    

    // MARK: - Actions
    @objc func handlePanGestureRecognizer(_ panRecognizer: UIPanGestureRecognizer) {
        guard panGestureRecognizer === panRecognizer else { return }
        
        switch panRecognizer.state {
        case .began, .changed:
            let translation = panRecognizer.translation(in: self.view)
            panRecognizer.view!.center = CGPoint(x: panRecognizer.view!.center.x + translation.x, y: panRecognizer.view!.center.y + translation.y)
            panRecognizer.setTranslation(CGPoint.zero, in: self.view)
            
        case .failed:
            break
            
        default:
            break
        }
    }
    
    @objc func handlePinchGestureRecognizer(_ pinchRecognizer: UIPinchGestureRecognizer) {
        guard pinchGestureRecognizer === pinchRecognizer else { return }
        
        redView.transform = redView.transform.scaledBy(x: pinchRecognizer.scale, y: pinchRecognizer.scale)
        pinchRecognizer.scale = 1
    }
    
    @objc func handleRotateGestureRecognizer(_ rotateRecognizer: UIRotationGestureRecognizer) {
        guard rotateGestureRecognizer === rotateRecognizer else { return }
        
        redView.transform = redView.transform.rotated(by: rotateRecognizer.rotation)
        rotateRecognizer.rotation = 0
    }
    
    @objc func handleTapGestureRecognizer(_ tapRecognizer: UITapGestureRecognizer) {
        guard tapGestureRecognizer === tapRecognizer else { return }
        
        tapRecognizer.view?.backgroundColor = UIColor(displayP3Red: CGFloat(Float.random(in: 0...1)), green: CGFloat(Float.random(in: 0...1)), blue: CGFloat(Float.random(in: 0...1)), alpha: 1)
        redView.transform = .identity
        redView.center = view.center
    }
    
    //MARK:- UIGestureRecognizerDelegate Methods
    func gestureRecognizer(_: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith shouldRecognizeSimultaneouslyWithGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

// MARK: - Private Helpers
private extension ViewController {
    func setUpPanGestureRecognizer() {
        panGestureRecognizer.addTarget(self, action: #selector(handlePanGestureRecognizer(_:)))
        panGestureRecognizer.delegate = self
        redView.addGestureRecognizer(panGestureRecognizer)
    }
    
    func setUpPinchGestureRecognizer() {
        pinchGestureRecognizer.addTarget(self, action: #selector(handlePinchGestureRecognizer(_:)))
        pinchGestureRecognizer.delegate = self
        redView.addGestureRecognizer(pinchGestureRecognizer)
    }
    
    func setUpRotateGestureRecognizer() {
        rotateGestureRecognizer.addTarget(self, action: #selector(handleRotateGestureRecognizer(_:)))
        rotateGestureRecognizer.delegate = self
        redView.addGestureRecognizer(rotateGestureRecognizer)
    }
    
    func setUpTapGestureRecognizer() {
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapGestureRecognizer(_:)))
        tapGestureRecognizer.delegate = self
        redView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setUpForceGestureRecognizer() {
        forceGestureRecognizer = ForceTouchGestureRecognizer(threshold: 0.7)
        forceGestureRecognizer?.delegate = self
        redView.addGestureRecognizer(forceGestureRecognizer!)
        
        forceGestureRecognizer?.forceUpdate = { [weak self] force in
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            self?.redView.backgroundColor?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            self?.view.backgroundColor = UIColor(red: red * force, green: green * force, blue: blue * force, alpha: 1)
        }
        
        forceGestureRecognizer?.endedStateCallback = {
            self.view.backgroundColor = UIColor.black
        }
    }
}

