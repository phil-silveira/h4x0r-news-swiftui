//
//  NetworkManager.swift
//  H4X0R News
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData(){
        guard let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let json = data else { return }
                
                let decoder = JSONDecoder()
                
                do {
                    let results = try decoder.decode(Results.self, from: json)
                    DispatchQueue.main.async {
                        self.posts = results.hits
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
