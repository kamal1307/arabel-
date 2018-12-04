//  RadioStation.swift
//  Swift Radio


import Foundation

struct RadioStation: Codable {
    
    var name: String
    var streamURL: String
    var desc: String
    var longDesc: String
   
    
    init(_ name: String, _ streamURL: String,  _ desc: String, _ longDesc: String) {
        
        self.name = name
        self.streamURL = streamURL
        self.desc = desc
        self.longDesc = longDesc
    }
}

