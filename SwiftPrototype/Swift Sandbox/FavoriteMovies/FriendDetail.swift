//
//  FriendDetail.swift
//  Swift Sandbox
//
//  Created by Gerhard Reyes on 2024-11-04.
//

import SwiftUI

struct FriendDetail: View {
    @Bindable var friend: MovieFriend
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    init(friend: MovieFriend, isNew: Bool) {
        self.friend = friend
        self.isNew = isNew
        
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
        }
        .navigationTitle(isNew ? "New Friend" : "Friend")
        .navigationTitle("Friend")
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
}
