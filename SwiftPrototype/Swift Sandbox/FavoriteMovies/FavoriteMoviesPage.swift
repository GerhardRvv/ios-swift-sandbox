//
//  FavoriteMoviesPage.swift
//  ChatPrototype
//
//  Created by Gerhard Reyes on 2024-11-03.
//

import SwiftUI

struct FavoriteMoviesPage: View {
    var body: some View {
        TabView {
            Tab("Friends", systemImage: "person.and.person") {
                FriendList()
            }
            
            Tab("Movies", systemImage: "film.stack") {
                MovieList()
            }
        }
    }
}

#Preview {
    FavoriteMoviesPage()
        .modelContainer(SampleData.shared.modelContainer)
}
