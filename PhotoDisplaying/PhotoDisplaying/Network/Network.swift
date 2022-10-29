//
//  Network.swift
//  PhotoDisplaying
//
//  Created by Uladzislau Komar on 29.10.22.
//

import Foundation
import UIKit

class MyNetwork {
    let mainURL: String = "https://jsonplaceholder.typicode.com/photos"
    var endedObj: [GetResponse]?
    
    func getPhotoListByDefaultMethod(completionHandler: @escaping ([GetResponse]) -> ()) {
        guard let url = URL(string: mainURL) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                return
            } else {
                guard let data = data else {
                    return
                }
                do {
                    let structData = try JSONDecoder().decode([GetResponse].self, from: data)
                    completionHandler(structData)
                } catch {
                    print("no")
                }
            }
        }
        
        task.resume()
    }
    
    
    func structureConcurrencyMethod() async throws -> ([GetResponse]) {
        guard let url = URL(string: mainURL) else {
            fatalError("No function")
        }
        async let result = try await download(url: url)
        let object = try await JSONDecoder().decode([GetResponse].self, from: result)
        return object
    }
    
    func download(url: URL) async throws -> (Data) {
        let result = try await URLSession.shared.data(from: url)
        return result.0
    }
    
    func fetchDownload(photosURL: [String]) async throws -> [UIImageView] {
        let urls = photosURL
        var result: [UIImageView] = []
        return try await withThrowingTaskGroup(of: Data.self, body: { group in
            for url in urls {
                group.addTask {
                    return try await self.download(url: URL(string: url)!)
                }
            }
            for try await data in group {
                await result.append(UIImageView(image: UIImage(data: data)))
            }
            return result
        })
    }
}



struct GetResponse: Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var tUrl: String
    
    enum CodingKeys: String, CodingKey {
        case albumId = "albumId"
        case id = "id"
        case title = "title"
        case url = "url"
        case tUrl = "thumbnailUrl"
    }
}
