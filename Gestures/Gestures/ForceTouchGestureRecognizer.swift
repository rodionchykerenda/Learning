//
//  UIForceGestureRecognizer.swift
//  Gestures
//
//  Created by Rodion Chikerenda on 12.03.2021.
//

import UIKit

class ForceTouchGestureRecognizer: UIGestureRecognizer {
    
    var startedStateCallback: ((UITouch) -> Void)?
    var fixedStateCallback: (() -> Void)?
    var forceUpdate: ((CGFloat) -> Void)?
    var endedStateCallback: (() -> Void)?
    
    private var threshold: CGFloat
    private var lastTouch: UITouch?
    private(set) var gestureState: RecognizerState = .ended {
        didSet {
            guard gestureState != oldValue else { return }
            
            switch gestureState {
            case .fixed:
                fixedStateCallback?()
            case .started:
                startedStateCallback?(lastTouch!)
                cancelsTouchesInView = true
            case .ended:
                cancelsTouchesInView = false
                
                if oldValue != .fixed {
                    endedStateCallback?()
                }
            }
        }
    }
    
    init(threshold: CGFloat) {
        self.threshold = threshold
        super.init(target: nil, action: nil)
        cancelsTouchesInView = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        changeState(.began, touches: touches, event: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        changeState(.changed, touches: touches, event: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        changeState(.ended, touches: touches, event: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        changeState(.cancelled, touches: touches, event: event)
    }
    
    func changeState(_ state: UIGestureRecognizer.State, touches: Set<UITouch>, event: UIEvent) {
        guard let touch = touches.first else { return }
        
        let force = touch.force / touch.maximumPossibleForce
        lastTouch = touch
        
        switch state {
        case .changed:
            if gestureState == .fixed {
                break
            }
            
            if gestureState == .ended && force < threshold {
                break
            }
            
            if gestureState == .ended && force >= threshold {
                gestureState = .started
            }
            
            forceUpdate?(force)
        case .ended, .cancelled, .failed:
            gestureState = .ended
        default:
            break
        }
    }
}

