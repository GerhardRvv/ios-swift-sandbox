//
//  FriendList.swift
//  ChatPrototype
//
//  Created by Gerhard Reyes on 2024-11-03.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    @Query(sort: \MovieFriend.name) private var friends: [MovieFriend]
    @Environment(\.modelContext) private var contex
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(friends) { friend in
                    NavigationLink(friend.name) {
                        Text("Detail view for \(friend.name)")
                            .navigationTitle("Friend")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            .navigationTitle("Friends")
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}
