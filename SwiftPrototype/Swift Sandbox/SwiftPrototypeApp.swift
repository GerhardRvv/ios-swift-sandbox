//
//  ChatPrototypeApp.swift
//  ChatPrototype
//
//  Created by Gerhard Reyes on 2024-11-01.
//

import SwiftUI
import SwiftData

@main
struct SwiftPrototypeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [
                    Friend.self,
                    Pal.self,
                    MovieFriend.self,
                    Movie.self
                ])
        }
    }
}
