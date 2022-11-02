//
//  NetworkManager.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 9/26/22.
//

import UIKit

class NetworkManager{
    
    static let shared = NetworkManager()
    private init() {}
    
    enum Endpoint{
        static let baseUrl = "https://yummie.glitch.me"
        
        case fetchAllCategories
        case placeOrder(String)
        case fetchCategoryDishes(String)
        case fetchOrders
        
        var stringValue: String{
            switch self {
            case .fetchAllCategories:
                return Endpoint.baseUrl + "/dish-categories"
            case .placeOrder(let dishId):
                return Endpoint.baseUrl + "/orders/\(dishId)"
            case .fetchCategoryDishes(let categoryId):
                return Endpoint.baseUrl + "/dishes/\(categoryId)"
            case .fetchOrders:
                return Endpoint.baseUrl + "/orders"
            }
        }
        
        var asURL : URL?{
            return URL(string: stringValue)
        }
    }
    
    func fetchAllCategories(completion:@escaping (Result<AllCategories, YummieError>)->Void){
        let urlString = Endpoint.fetchAllCategories
        
        guard let url = urlString.asURL else { return }
        taskForGetRequest(url: url, response: AllCategories.self, completion: completion)
    }
    
    func downloadImage(from urlString: String, completion:@ escaping (UIImage?)-> Void){
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
    
            guard error == nil else{ completion(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{ completion(nil)
                return
            }
            
            guard let data = data else { completion(nil)
                return
            }
            
            guard let image = UIImage(data: data) else{ return }
            
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }
    
    private func taskForGetRequest<ResponseType: Decodable>(url: URL, response: ResponseType.Type, completion:@escaping (Result<ResponseType, YummieError>) ->Void){
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error{
                DispatchQueue.main.async {
                    completion(.failure(.unableToComplete))
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                DispatchQueue.main.async {
                    completion(.failure(.serverError))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.errorDecoding))
                    print("Here!!!!")
                }
                return
            }
            
            let decoder = JSONDecoder()
            do{
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
            }catch{
                DispatchQueue.main.async {
                    completion(.failure(.errorDecoding))
                    print("na this place")
                }
            }
        }
        task.resume()
    }
}
