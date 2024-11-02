//
//  Untitled.swift
//  MVVM SUI 6
//
//  Created by Andrew on 02.11.2024.
//

import SwiftUI

struct ContentView: View {
    
    init() {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color(red: 0.141, green: 0.165, blue: 0.196, opacity: 1))

            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    
    var body: some View {
        TabView {
                NavigationView {
                    Color.clear
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Text("What do you want to watch?")
                                    .font(.system(size: 16, weight: .bold))
                            }
                        }
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            

            NavigationView {
                    Color.clear
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Text("Search")
                                    .font(.system(size: 16, weight: .bold))
                            }
                        }
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")

                }

            NavigationView {
                Color.clear
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Detail")
                                .font(.system(size: 16, weight: .bold))
                        }
                    }
            }
            .tabItem {
                Image(systemName: "person.circle")
                Text("Details")

            }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
}
