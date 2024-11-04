//
//  ViewModel.swift
//  MVVM SUI 6
//
//  Created by Andrew on 03.11.2024.
//

import SwiftUI

final class ViewModel: ObservableObject {
    @Published var model: PhotoUnsplash = PhotoUnsplash(results: [.init(urls: .init(regular: "", full: ""))])
    let service = DefaultAPIClient()
    
    func fetchPhoto() {
        
        Task {
            model = try await service.sendRequest(endpoint: GetPhotoRequest.init(requiresAuth: true, page: 1))
            
        }
    }
}
