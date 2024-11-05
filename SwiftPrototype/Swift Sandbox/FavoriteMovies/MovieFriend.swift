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
    var favoriteMovie: Movie?
    
    init(name: String) {
        self.name = name
    }
    
    static let  sampleData = [
        MovieFriend(name: "Gerhard"),
        MovieFriend(name: "Gerardo"),
        MovieFriend(name: "Jerry"),
        MovieFriend(name: "Gerry")
    ]
}
