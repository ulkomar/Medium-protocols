//
//  NetworkService.swift
//  Codable
//
//  Created by Uladzislau Komar on 23.10.22.
//

import Foundation

enum HTTPMethod: String {
    case POST
    case GET
    case DELETE
    case PUT
    case PATCH
    case HEAD
}

enum Result<T> {
    case some(object: T)
    case error(description: String )
}

class NetworkService {
    let baseURL = "https://httpbin.org"
    
    func sendRequest<T: Encodable, U: Decodable>(
        endPoint: String,
        httpMethod: HTTPMethod = .GET,
        headers: [String: String],
        model: T,
        parseType: U.Type,
        completion: @escaping (Result<U>) -> Void
    ) {
        let urlString = baseURL + endPoint
        guard let url = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        request.httpBody = try? JSONEncoder().encode(model)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(Result.error(description: error.localizedDescription))
                return
            } else {
                guard let data = data,
                      let dataString = String(data: data, encoding: .utf8) else {
                    return
                }
                do {
                    let result = try JSONDecoder().decode(U.self, from: data)
                    completion(Result.some(object: result))
                } catch {
                    print(error.localizedDescription)
                    completion(Result.error(description: "No data"))
                }
            }
        }
        
        task.resume()
        
    }
}

class Parser<T: Decodable> {
    func parse(data: Data) -> Any? {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

func makeGetRequest() {
    guard let url = URL(string: "") else {
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let _ = error {
            return
        } else {
            guard
                let data = data,
                let response = response else {
                return
            }
            let result = String(data: data, encoding: .utf8)
            print(result ?? "")
        }
    }
    
    task.resume()
}

func makePostRequest() {
    guard let url = URL(string: "") else {
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-type")
    request.httpBody = try? JSONEncoder().encode([5: "Hello"])
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let _ = error {
            return
        } else {
            guard
                let data = data,
                let response = response as? HTTPURLResponse else {
                return
            }
            let result = String(data: data, encoding: .utf8)
            print(result ?? "")
        }
    }
    
    task.resume()
    
}
