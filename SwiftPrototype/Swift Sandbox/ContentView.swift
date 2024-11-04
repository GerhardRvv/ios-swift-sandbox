//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Gerhard Reyes on 2024-11-01.
//

import SwiftUI
import SwiftData

let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct ContentView: View {
    var body: some View {
        TabView {
            FavoriteMoviesPage()
                .tabItem {
                    Image(systemName: "film")
                    Text("Movies")
                }
            
            BirthdaysPage()
                .tabItem {
                    Image(systemName: "gift")
                    Text("Birthdays")
                }
            
            ScoreKeeperPage()
                .tabItem {
                    Image(systemName: "star.circle")
                    Text("Score Keeper")
                }
            
            PickAPalPage()
                .tabItem {
                    Image(systemName: "person.3.sequence.fill")
                    Text("Pick-A-Pal")
                }
            
            DicePage()
                .tabItem {
                    Image(systemName: "dice")
                    Text("Dice")
                }
            
            FeaturesPage()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Features")
                }
            
            WeatherPage()
                .tabItem {
                    Image(systemName: "cloud.sun")
                    Text("Weather")
                }
            
            WelcomePage()
                .tabItem {
                    Image(systemName: "hand.wave")
                    Text("Welcome")
                }
        }
//        .background(Gradient(colors: gradientColors))
        .foregroundStyle(.primary)
        .tabViewStyle(DefaultTabViewStyle())
    }
}

#Preview {
    ContentView()
}
