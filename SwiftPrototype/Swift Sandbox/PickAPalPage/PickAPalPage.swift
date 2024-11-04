//
//  ListPage.swift
//  ChatPrototype
//
//  Created by Gerhard Reyes on 2024-11-01.
//

import SwiftUI
import SwiftData

struct PickAPalPage: View {
    @Query(sort: \Pal.name) private var pals: [Pal]
    @Environment(\.modelContext) private var context
    
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false

    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            
            List(pals) { pal in
                Text(pal.name)
                    .foregroundStyle(.accent)
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack {
                TextField("Add Name", text: $nameToAdd)
                    .autocorrectionDisabled()
                    .onSubmit {
                        if !nameToAdd.isEmpty {
                            context.insert(Pal(name: nameToAdd))
                            nameToAdd = ""
                        }
                    }
                
                Divider()
                
                Toggle("Remove when picked", isOn: $shouldRemovePickedName)
                    .disabled(pals.isEmpty)
                    .padding(.horizontal, 16)
                
                
                Button {
                    if let randomName = pals.randomElement() {
                        pickedName = randomName.name
                        
                        if shouldRemovePickedName {
                            context.delete(randomName)
                            shouldRemovePickedName = !pals.isEmpty
                        }
                    } else {
                        pickedName = ""
                    }
                } label: {
                    Text("Pick Random Name")
                        .padding(.vertical, 8)
                }
                .disabled(pals.isEmpty)
                .padding(.horizontal, 16)
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .foregroundStyle(.white)
            }
            .padding(.bottom, 60)
            .padding(.top, 10)
            .padding(.horizontal, 16)
        }
        
//        .task {
//            context.insert(Pal(name: "Elton Lin"))
//            context.insert(Pal(name: "Jenny Court"))
//        }
    }
}

#Preview {
    PickAPalPage()
        .modelContainer(for: Pal.self, inMemory: true)
}
