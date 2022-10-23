//
//  ViewController.swift
//  URLSession
//
//  Created by Uladzislau Komar on 22.10.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        makeGetRequest()
//        makePostRequest()
        uploadImage()
    }

    func uploadImage() {
        guard let url = URL(string: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg") else {
            return ()
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                return ()
            } else {
                DispatchQueue.main.async {
                    guard let data = data else {return ()}
                    self.image.image = UIImage(data: data)
                }
            }
        }
        
        task.resume()
    }
    //MARK: Only a get request
    func makeGetRequest() {
        guard let url = URL(string: "https://httpbin.org/get") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                print("There is an error")
            } else {
                if let data = data,
                   let dataString = String(data: data, encoding: .utf8) {
                    print(dataString)
                }
            }
        }
        
        task.resume()
    }
    //MARK: Only a post request
    
    func makePostRequest() {
        guard let url = URL(string: "https://httpbin.org/post") else {
            return ()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        let make = Make()
        
        request.httpBody = try? JSONEncoder().encode(make)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                print("There is an error")
            } else {
                if let data = data,
                   let dataString = String(data: data, encoding: .utf8) {
                    print(dataString)
                }
            }
        }
        
        task.resume()
    }
    

}

class Make: Encodable {
    var id: Int = 0
    var st: String = ""
}
