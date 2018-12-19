//  RadioStation.swift
//  Swift Radio


import Foundation

struct RadioStation {
    
    var name: String
    var streamURL: String
    var desc: String
    var longDesc: String
   
    
    /// Construteur qui initialise les 4 variables.
    ///
    /// - Parameters:
    ///   - name: le nom du flux audio
    ///   - streamURL: l'url de l'audio
    ///   - desc: le slogant d'arabel
    ///   - longDesc: la déscription d'arabel
    init(_ name: String, _ streamURL: String,  _ desc: String, _ longDesc: String) {
        
        self.name = name
        self.streamURL = streamURL
        self.desc = desc
        self.longDesc = longDesc
    }
}

