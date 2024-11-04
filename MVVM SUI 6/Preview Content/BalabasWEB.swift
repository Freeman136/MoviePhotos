//
//  BalabasWEB.swift
//  MVVM SUI 6
//
//  Created by Andrew on 03.11.2024.
//

import Foundation

//protocol NetworkServiceProtocol {
//    func getData() async throws -> Data
//    
//    
//}
//
//final class NetworkService: NetworkServiceProtocol {
//    func getData() async throws -> Data {
//        
//        
//    }
//}
//
//extension URL {
//    init? (path: String, endPoint: String, queryItems: [URLQueryItem]) -> URL {
//        guard let url = URL(string: path)?.appendingPathComponent(endPoint),
//              var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
//        urlComponents.queryItems = queryItems
//        
//        return urlComponents.url
//    }
//}





import Foundation

protocol APIClient {
    func sendRequest<T: Decodable>(endpoint: APIRequest) async throws -> T
}
import Foundation

protocol APIRequest {
    var url: URL? { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    var requiresAuth: Bool { get }

}
import Foundation

class DefaultAPIClient: APIClient {
    var authToken = "Client-ID Ip0XA55zY7b7-d19osq1L5btGg-YCeDZVpnnJjXqHxs"
    
    func sendRequest<T: Decodable>(endpoint: APIRequest) async throws -> T {
        guard let url = endpoint.url else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = endpoint.body
        
        if endpoint.requiresAuth {
            request.setValue("Bearer\(authToken)", forHTTPHeaderField: "Authorization")
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                throw APIError.unexpectedStatusCode(httpResponse.statusCode)
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                return result
            } catch {
                throw APIError.decodingError(error)
            }

        } catch {
            throw APIError.requestFailed(error)
        }
    }
}

struct GetPhotoRequest: APIRequest {
    var requiresAuth: Bool
    
    let page: Int

    var url: URL? {
        URL(string: "https://api.unsplash.com/photos?/page=\(page)")
    }

    var method: HTTPMethod {
        .GET
    }

    var headers: [String : String]? {
        nil
    }

    var body: Data? {
        nil
    }
}
import Foundation

//let apiClient: APIClient = DefaultAPIClient()

//func fetchUser(userID: Int) async {
//    let request = GetUserRequest(requiresAuth: true, page: page)
//
//    do {
//        let user: PhotoUnsplash = try await apiClient.sendRequest(endpoint: request)
//        print("Пользователь: (user)")
//    } catch {
//        print("Ошибка при получении пользователя: (error)")
//    }
//}

enum APIError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingError(Error)
    case unexpectedStatusCode(Int)
}

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
    // Добавьте другие методы по необходимости
}

struct PhotoUnsplash: Decodable {
    let results: [UnsplashPhotoUrls]?
}


struct UnsplashPhotoUrls: Decodable {
    let urls: UnsplashPhotoURLs?
}

struct UnsplashPhotoURLs: Decodable {
    let regular: String?
    let full: String?
}
