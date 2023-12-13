//
//  ContentView.swift
//  BodyRhythm
//
//  Created by Aziza Rahimova on 07/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            SleepPageView()
                .tabItem {
                    Image("Statistics")
                }
            FitnessPageView()
                .tabItem {
                    Image("Moon")
                }
            
            Text("Fitness")
                .tabItem {
                    Image("Fitness")
                }
            
            Text("Profile")
                .tabItem {
                    Image("Profile")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
