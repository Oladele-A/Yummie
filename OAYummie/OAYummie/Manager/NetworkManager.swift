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
    
    
    func fetchCategoryDishes(categoryId: String, completion:@escaping (Result<DishList, YummieError>) -> Void){
        let urlString = Endpoint.fetchCategoryDishes(categoryId)
        
        guard let url = urlString.asURL else { return }
        taskForGetRequest(url: url, response: DishList.self, completion: completion)
    }
    
    
    func placeOrder(name: String, dishId: String, completion:@escaping (Result<PlaceOrder, YummieError>)->Void){
        let body = OrderRequest(name: name)
        let urlString = Endpoint.placeOrder(dishId)
        
        guard let url = urlString.asURL else { return }
        taskForPostRequest(url: url, response: PlaceOrder.self, requestBody: body, completion: completion)
    }
    
    
    func fetchOrders(completion:@escaping (Result<FetchOrders, YummieError>)->Void){
        let urlString = Endpoint.fetchOrders
        
        guard let url = urlString.asURL else { return }
        taskForGetRequest(url: url, response: FetchOrders.self, completion: completion)
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
            
            completion(image)
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
                }
            }
        }
        task.resume()
    }
    
    private func taskForPostRequest<ResponseType:Decodable, RequestType:Encodable>(url:URL,
                                                                                   response:ResponseType.Type,
                                                                                   requestBody: RequestType,
                                                                                   completion:@escaping (Result<ResponseType, YummieError>)-> Void){
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        do{
            let postObject = try encoder.encode(requestBody)
            request.httpBody = postObject
        }catch{
            completion(.failure(.unknownError))
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let _ = error{
                DispatchQueue.main.async {
                    completion(.failure(.unableToComplete))
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(.failure(.serverError))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.errorDecoding))
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
                }
            }
        }
        task.resume()
    }
}
