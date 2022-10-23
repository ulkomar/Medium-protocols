//
//  ViewController.swift
//  Codable
//
//  Created by Uladzislau Komar on 23.10.22.
//

import UIKit

//struct GetResponse {
//    let header: Headers?
//    let origin: String
//    let url: String
//}
//
//struct Headers {
//    let accept: String
//    let acceptEncoding: String
//    let acceptLanguage: String
//    let host: String
//    let userAgent: String
//}


class ViewController: UIViewController {

    let myService = MyService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        makeGetRequest()
        myService.obtainGetResponse()
    }

//    func makeGetRequest() {
//        guard let url = URL(string: "https://httpbin.org/get") else {
//            return ()
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let _ = error {
//                return ()
//            } else {
//                if let data = data {
//                    // JSON parser
//                    let result = try? JSONDecoder().decode(GetResponse.self, from: data)
//                    dump(result)
//                }
//            }
//        }
//        task.resume()
//    }
}

struct GetResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case customUrl = "url"
        case headers = "headers"
        case origin = "origin"
    }
    
    let headers: Headers?
    let origin: String
    let customUrl: String
}

struct Headers: Decodable {
    let accept: String
    let acceptEncoding: String
    let acceptLanguage: String
    let host: String
    let userAgent: String
    
    enum CodingKeys: String, CodingKey {
        case accept = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case acceptLanguage = "Accept-Language"
        case host = "Host"
        case userAgent = "User-Agent"
    }
}
