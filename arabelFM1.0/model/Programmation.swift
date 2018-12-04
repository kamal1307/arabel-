//
//  Programmation.swift
//  arabelFM1.0
//
//  Created by Admin on 30/11/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

struct Programmation: Codable {
    
    var title: String
    var time: String
 
    init(_ title: String, _ time: String) {
        
        self.title = title
        self.time = time
    }
    
    mutating func setTitle (_ title: String) {
        
        self.title = title
        
    }
    
    mutating func setTime (_ time: String) {
       
        self.time = time
        
    }
    
    func getTitle ()-> String {
        
        return self.title
        
    }
    
    func getTime ()-> String {
        
        return self.time
    }
}
