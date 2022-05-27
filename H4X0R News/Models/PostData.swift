//
//  PostData.swift
//  H4X0R News
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    let objectID: String
    let title: String
    let url: String?
    let points: Int
    
    var id: String {
        return objectID
    }
}
