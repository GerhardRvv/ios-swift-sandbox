//
//  FriendDetail.swift
//  Swift Sandbox
//
//  Created by Gerhard Reyes on 2024-11-04.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {
    @Bindable var friend: MovieFriend
    let isNew: Bool
    
    @State private var newFriendName = ""
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    init(friend: MovieFriend, isNew: Bool) {
        self.friend = friend
        self.isNew = isNew
        
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $newFriendName)
                .autocorrectionDisabled()
            Picker("Favorite Movie", selection: $friend.favoriteMovie) {
                Text("None")
                    .tag(nil as Movie?)
                
                ForEach(movies) { movie in
                    Text(movie.title)
                        .tag(movie)
                }
            }
        }
        .navigationTitle(isNew ? "New Friend" : "Friend")
        .navigationTitle("Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        friend.name = newFriendName
                        dismiss()
                    }
                    .disabled(newFriendName.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        context.delete(friend)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
    }
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("New Friend") {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
