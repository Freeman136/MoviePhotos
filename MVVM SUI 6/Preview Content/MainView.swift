//
//  ContentView.swift
//  MVVM SUI 6
//
//  Created by Andrew on 01.11.2024.
//

import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    
    @Published var text: String = "Hello, SwiftData!"
    
}

struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            
            Text(viewModel.text)
                .padding()
            
            Button("Изменить текст") {
                viewModel.text = "Текст изменен!"
            }
            .padding()
        }
    }
}

#Preview {
    MainView()
}
