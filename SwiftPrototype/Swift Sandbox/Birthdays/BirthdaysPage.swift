//
//  BirthdaysView.swift
//  ChatPrototype
//
//  Created by Gerhard Reyes on 2024-11-02.
//

import SwiftUI
import SwiftData

    struct BirthdaysPage: View {
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        NavigationStack() {
            Text("Birthdays")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray6))
                .shadow(color: .gray, radius: 5, x: 0, y: 4)
                .font(.largeTitle)
                .bold()

            List(friends) { friend in
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    
                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                            .autocorrectionDisabled()
                    }
                    
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newDate)
                        context.insert(newFriend)
                        
                        newName = ""
                        newDate = Date.now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
        }
        .padding(.bottom, 40)
        .foregroundColor(.primary)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
