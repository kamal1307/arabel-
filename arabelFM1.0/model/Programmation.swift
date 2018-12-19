//
//  Programmation.swift
//  arabelFM1.0
//
//  Created by Admin on 30/11/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

struct Programmation {
    
    var title: String
    var time: String
 
    
    /// Constructeur qui initialise les 2 variables.
    ///
    /// - Parameters:
    ///   - title: le titre de l'émission
    ///   - time: l'horaire de l'émission
    init(_ title: String, _ time: String) {
        
        self.title = title
        self.time = time
        
    }
    
    
    /// Mutateur pour modifier le titre.
    ///
    /// - Parameter title: la nouvel émission
    mutating func setTitle (_ title: String) {
        
        self.title = title
        
    }
    
    /// Mutateur pour modifier l'horaire de la nouvel émission.
    ///
    /// - Parameter time: <#time description#>
    mutating func setTime (_ time: String) {
       
        self.time = time
        
    }
    
    /// Accesseur qui retourne le titre de l'émission.
    ///
    /// - Returns: retourne le titre de l'émission
    func getTitle ()-> String {
        
        return self.title
        
    }
    
    /// Accesseur qui retourne l'horaire de l'émission.
    ///
    /// - Returns: retourne l'horaire de l'émission
    func getTime ()-> String {
        
        return self.time
    }
}
