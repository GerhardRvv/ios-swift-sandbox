//
//  MovieFriend.swift
//  ChatPrototype
//
//  Created by Gerhard Reyes on 2024-11-03.
//

import Foundation
import SwiftData

@Model
class MovieFriend {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    static let  sampledata = [
        MovieFriend(name: "Gerhard"),
        MovieFriend(name: "Alessa"),
        MovieFriend(name: "Meggan"),
        MovieFriend(name: "Gienatzy")
    ]
}
