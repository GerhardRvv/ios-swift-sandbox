//
//  MovieDetail.swift
//  Swift Sandbox
//
//  Created by Gerhard Reyes on 2024-11-04.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    init(movie: Movie, isNew: Bool) {
        self.movie = movie
        self.isNew = isNew
    }
    
    var sortedFriends: [MovieFriend] {
        movie.favoritedBy.sorted { first, second in
            first.name < second.name
        }
    }
    
    var body: some View {
        Form {
            TextField("Movie title", text: $movie.title)
            DatePicker("Release date", selection: $movie.releaseDate, displayedComponents: .date)
            
            if !movie.favoritedBy.isEmpty {
                Section("Favorited by:") {
                    ForEach(sortedFriends) { friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle(isNew ? "New Moview" : "Movie")
        .navigationTitle("Movie")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        context.delete(movie)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        MovieDetail(movie: SampleData.shared.movie, isNew: true)
    }
}
