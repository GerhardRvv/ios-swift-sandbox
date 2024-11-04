//
//  ScoreKeeperPege.swift
//  ChatPrototype
//
//  Created by Gerhard Reyes on 2024-11-01.
//

import SwiftUI

struct ScoreKeeperPage: View {
    @State private var scoreboard = Scoreboard()
    @State private var startingPoints = 0

    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            SettingsView(doesHighestScoreWin: $scoreboard.doesHighestScoreWin, startingPoints: $startingPoints)
                .disabled(scoreboard.state != .setup)
            
            Grid(alignment: .leading) {
                GridRow {
                    HStack {
                        Text("Players")
                            .gridColumnAlignment(.leading)
                    }
                    Text("Score")
                        .opacity(scoreboard.state == .setup ? 0 : 1.0)
                }
                .font(.headline)
                
                ForEach($scoreboard.players) { $player in
                    GridRow {
                        
                        TextField("Name", text: $player.name)
                        
                        Text("\(player.score)")
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                        
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                            .opacity((scoreboard.state == .setup || scoreboard.state == .gameOver) ? 0 : 1.0)
                        
                        if scoreboard.winners.contains(player) {
                            Image(systemName: "crown.fill")
                                .foregroundStyle(Color.yellow)
                        }
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                scoreboard.players.append(Player(name: "", score: 0))
            }
            .opacity(scoreboard.state == .setup ? 1.0 : 0)
            
            Spacer()
            HStack {
                Spacer()
                
                switch scoreboard.state {
                case .setup:
                    Button("Start Game", systemImage: "play.fill") {
                        scoreboard.state = .playing
                        scoreboard.resetScores(to: startingPoints)
                    }
                case .playing:
                    Button("End Game", systemImage: "stop.fill") {
                        scoreboard.state = .gameOver
                    }
                case . gameOver:
                    Button("Reset Game", systemImage: "arrow.counterclockwise") {
                        scoreboard.state = .setup
                    }
                }
                Spacer()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(.primary)
        }
        .padding()
        .padding(.bottom, 20)
    }
}

#Preview {
    ScoreKeeperPage()
}
