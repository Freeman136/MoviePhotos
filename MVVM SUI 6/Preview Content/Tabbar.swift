//
//  Tabbar.swift
//  MVVM SUI 6
//
//  Created by Andrew on 02.11.2024.
//

import SwiftUI




struct Tabbar: View {
    
    @StateObject var model = ViewModel()
    
//    @State var selection = "2"
//    
//    init() {
//        
//        let appearance = UITabBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = UIColor(Color(red: 0.141, green: 0.165, blue: 0.196, opacity: 1))
//        
//        UITabBar.appearance().standardAppearance = appearance
//        UITabBar.appearance().scrollEdgeAppearance = appearance
//        
//    }
    
    var body: some View {
        AsyncImage(url: URL(string: (model.model.results?[0].urls?.regular!)!))
//        
//            
//        TabView (selection: $selection) {
//            NavigationView {
//                Color.clear
//                    .toolbar {
//                        ToolbarItem(placement: .principal) {
//                            Text("What do you want to watch?")
//                                .font(.system(size: 16, weight: .bold))
//                        }
//                    }
//            }
//            
//            .tag("1")
//            .tabItem {
//                Image(systemName: "house")
//                Text("Home")
//            }
//            
//            NavigationView {
//                Color.clear
//                    .toolbar {
//                        ToolbarItem(placement: .principal) {
//                            Text("Search")
//                                .font(.system(size: 16, weight: .bold))
//                        }
//                    }
//            }
//            
//            .tag("2")
//            .tabItem {
//                Image(systemName: "magnifyingglass")
//                Text("Search")
//            }
//            
//            NavigationView {
//                Color.clear
//                    .toolbar {
//                        ToolbarItem(placement: .principal) {
//                            Text("Detail")
//                                .font(.system(size: 16, weight: .bold))
//                        }
//                    }
//            }
//            
//            .tag("3")
//            .tabItem {
//                Image(systemName: "person.circle")
//                Text("Details")
//            }
//        }
//        .accentColor(.blue)
//        
        .task {
            model.fetchPhoto()
        }
    }
  
}

#Preview {
    Tabbar()
}
