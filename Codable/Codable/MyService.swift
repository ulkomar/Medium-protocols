//
//  MyService.swift
//  Codable
//
//  Created by Uladzislau Komar on 23.10.22.
//

import Foundation

class MyService {
    let networkService = NetworkService()
    
    func obtainGetResponse() {
        let model = ["Hello":"Me"]
        networkService.sendRequest(
            endPoint: "/post",
            httpMethod: .POST,
            headers: ["Content-type": "application/json"],
            model: model,
            parseType: GetResponse.self) { result in
                switch result {
                case .error(let error):
                    print(error)
                case .some(let object):
                    dump(object)
                }
            }
    }
    
    func obtainPostResponse() {
        
    }
}

