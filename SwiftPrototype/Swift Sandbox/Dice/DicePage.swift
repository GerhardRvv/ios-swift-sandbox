//
//  DiceView.swift
//  ChatPrototype
//
//  Created by Gerhard Reyes on 2024-11-01.
//

import SwiftUI

struct DicePage: View {
    @State private var numberOfDice: Int = 1
    
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundStyle(.primary)
            
            HStack {
                ForEach(1...numberOfDice, id: \.description) { _ in
                    DiceView()
                }
            }
            
            HStack {
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    withAnimation {
                        numberOfDice -= 1
                    }
                }
                .padding()
                .labelStyle(.iconOnly)
                .font(.title)
                .disabled(numberOfDice <= 1)
                
                Button("Add Dice", systemImage: "plus.circle.fill") {
                    withAnimation {
                        numberOfDice += 1
                    }
                }
                .padding()
                .labelStyle(.iconOnly)
                .font(.title)
                .disabled(numberOfDice >= 5)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct DiceView: View {
    @State private var numberOfPimps: Int = 1
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPimps).fill")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .gradientBottom)
            
            Button("Roll") {
                withAnimation {
                    numberOfPimps = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.bordered)
        }
        .tint(.accent)
    }
}

#Preview {
    DicePage()
}
