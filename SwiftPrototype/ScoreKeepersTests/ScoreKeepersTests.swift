//
//  ScoreKeepersTests.swift
//  ScoreKeepersTests
//
//  Created by Gerhard Reyes on 2024-11-02.
//

import Testing
@testable import ChatPrototype

struct ScoreKeepersTests {

    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = Scoreboard(players: [
            Player(name: "Gerhard", score: 0),
            Player(name: "Alessa", score: 5)
        ])
        scoreboard.resetScores(to: 0)
        
        for player in scoreboard.players {
            #expect(player.score == 0)
        }
    }
    
    @Test("Highest score wins")
    func highestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Gerhard", score: 0),
                Player(name: "Alessa", score: 4),
            ],
            state: .gameOver,
            doesHighestScoreWin: true
        )
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Alessa", score: 4)])
    }
    
    @Test("Lowest score wins")
    func lowestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Gerhard", score: 2),
                Player(name: "Alessa", score: 1)
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Alessa", score: 1)])
    }

}
