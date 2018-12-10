//
//  UIbuttinExtension.swift
//  arabelFM1.0
//
//  Created by Admin on 08/12/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

extension UIButton {
    
    func pulsastion() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil)
        
    }
}
