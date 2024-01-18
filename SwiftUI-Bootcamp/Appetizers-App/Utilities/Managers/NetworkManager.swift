//
//  NetworkManager.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 17/1/24.
//

import SwiftUI

final class NetworkManager{
    /// singleton
    static let shared = NetworkManager()
    private init(){}

    private static let baseURL = "http://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerEndpoint = baseURL + "appetizers"
    
    private let cache = NSCache<NSString, UIImage>()
   
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void){
        /// If your closure is passed as a parameter to a function and is called after the function returns, it's marked as @escaping.
        guard let url = URL(string: appetizerEndpoint) else{
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let res = try decoder.decode( AppetizerResponse.self, from: data)
                completed(.success(res.request))
            }catch{
                completed(.failure(.invalidData))
            }
        }
         
        task.resume()
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?)-> Void){
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            completed(image) /// We have the image in the cache
            return
        }
        
        guard let url = URL(string: urlString) else{
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, response, error in
            guard let data = data,let image = UIImage(data: data) else{
                completed(nil)
                return
            }
            self.cache.setObject( image, forKey: cacheKey)
            completed(image)
            
        }
        task.resume()
        
        
    }
}
